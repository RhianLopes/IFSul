package br.com.example.atividade1.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

import com.github.rtoshiro.util.format.MaskFormatter;
import com.github.rtoshiro.util.format.SimpleMaskFormatter;
import com.github.rtoshiro.util.format.pattern.MaskPattern;
import com.github.rtoshiro.util.format.text.MaskTextWatcher;
import com.google.android.material.textfield.TextInputEditText;
import com.google.android.material.textfield.TextInputLayout;
import com.mobsandgeeks.saripaar.ValidationError;
import com.mobsandgeeks.saripaar.Validator;
import com.mobsandgeeks.saripaar.annotation.Checked;
import com.mobsandgeeks.saripaar.annotation.Email;
import com.mobsandgeeks.saripaar.annotation.Length;
import com.mobsandgeeks.saripaar.annotation.NotEmpty;

import java.util.ArrayList;
import java.util.List;

import br.com.example.atividade1.R;
import br.com.example.atividade1.enumeration.Genre;
import br.com.example.atividade1.enumeration.Interest;
import br.com.example.atividade1.model.User;

public class SaveActivity extends AppCompatActivity implements Validator.ValidationListener {

    private final static List<User> USERS = new ArrayList<>();

    @NotEmpty(messageResId = R.string.str_validation_not_empty_message)
    @Length(min = 3, max = 20, messageResId = R.string.str_validation_min_max_size_name)
    private TextInputEditText etName;

    @NotEmpty(messageResId = R.string.str_validation_not_empty_message)
    @Email(messageResId = R.string.str_validation_email)
    private TextInputEditText etEmail;

    @NotEmpty(messageResId = R.string.str_validation_not_empty_message)
    @Length(min = 13, max = 13, messageResId = R.string.str_validation_min_max_size_phone)
    private TextInputEditText etPhone;

    @NotEmpty(messageResId = R.string.str_validation_not_empty_message)
    @Length(min = 10, max = 10, messageResId = R.string.str_validation_min_max_size_birth_date)
    private TextInputEditText etBirthDate;

    private TextInputLayout txtName;

    private TextInputLayout txtEmail;

    private TextInputLayout txtPhone;

    private TextInputLayout txtBirthDate;

    @Checked(messageResId = R.string.str_validation_genre_selected)
    private RadioGroup rgGenre;

    private RadioButton rbMale;

    private RadioButton rbFemale;

    private CheckBox cbMusic;

    private CheckBox cbMovie;

    private Button btSave;

    private Validator validator;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.save_screen);
        initComponents();
        btSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                validator.validate();
            }
        });
    }

    @Override
    public void onValidationSucceeded() {
        Toast.makeText(this, "Cadastrado com Sucesso!", Toast.LENGTH_SHORT).show();
        USERS.add(buildNewUser());
        clearComponents();
    }

    @Override
    public void onValidationFailed(List<ValidationError> errors) {
        for (ValidationError error : errors) {
            View view = error.getView();
            String message = error.getCollatedErrorMessage(this);
            if (view instanceof TextInputEditText) {
                switch (view.getId()) {
                    case R.id.et_name:
                        txtName.setError(message);
                        break;
                    case R.id.et_email:
                        txtEmail.setError(message);
                        break;
                    case R.id.et_phone:
                        txtPhone.setError(message);
                        break;
                    case R.id.et_birth_date:
                        txtBirthDate.setError(message);
                }
            } else {
                Toast.makeText(this, message, Toast.LENGTH_LONG).show();
            }
        }
    }

    private User buildNewUser() {
        return User.builder()
                .name(txtName.getEditText().getText().toString())
                .email(txtEmail.getEditText().getText().toString())
                .phone(txtPhone.getEditText().getText().toString())
                .birthDate(txtBirthDate.getEditText().getText().toString())
                .genre(rbMale.isChecked() ? Genre.MALE : Genre.FEMALE)
                .interests(getInterests())
                .build();
    }

    private List<Interest> getInterests() {
        final List<Interest> interests = new ArrayList<>();
        if (cbMovie.isChecked()) {
            interests.add(Interest.MOVIE);
        }
        if (cbMusic.isChecked()) {
            interests.add(Interest.MUSIC);
        }
        return interests;
    }

    private void initComponents() {
        etName = findViewById(R.id.et_name);
        etEmail = findViewById(R.id.et_email);
        etPhone = findViewById(R.id.et_phone);
        etBirthDate = findViewById(R.id.et_birth_date);
        btSave = findViewById(R.id.bt_save);
        rgGenre = findViewById(R.id.rg_genre);
        rbMale = findViewById(R.id.rb_male);
        rbFemale = findViewById(R.id.rb_female);
        cbMusic = findViewById(R.id.cb_music);
        cbMovie = findViewById(R.id.cb_movie);
        validator = new Validator(this);
        validator.setValidationListener(this);
        txtName = findViewById(R.id.txt_name);
        txtEmail = findViewById(R.id.txt_email);
        txtPhone = findViewById(R.id.txt_phone);
        txtBirthDate = findViewById(R.id.txt_birth_date);

        SimpleMaskFormatter smf = new SimpleMaskFormatter("(NN)NNNNNNNNN");
        MaskTextWatcher mtw = new MaskTextWatcher(etPhone, smf);
        etPhone.addTextChangedListener(mtw);

        MaskPattern mp03 = new MaskPattern("[0-3]");
        MaskPattern mp09 = new MaskPattern("[0-9]");
        MaskPattern mp01 = new MaskPattern("[0-1]");
        MaskFormatter mf = new MaskFormatter("[0-3][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]");
        mf.registerPattern(mp01);
        mf.registerPattern(mp03);
        mf.registerPattern(mp09);
        MaskTextWatcher mtw2 = new MaskTextWatcher(etBirthDate, mf);
        etBirthDate.addTextChangedListener(mtw2);
    }

    private void clearComponents() {
        etName.setText("");
        etEmail.setText("");
        etPhone.setText("");
        etBirthDate.setText("");
        rgGenre.clearCheck();
        cbMusic.setChecked(false);
        cbMovie.setChecked(false);
    }
}