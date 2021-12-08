package br.com.example.atividade.activities;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;

import br.com.example.atividade.R;
import br.com.example.atividade.model.User;
import br.com.example.atividade.repository.UserRepository;

public class ListActivity extends AppCompatActivity {

    private ArrayAdapter<User> arrayAdapter;

    private ListView listView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.list_screen);
        initComponents();
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(ListActivity.this, EditActivity.class);
                Bundle bundle = new Bundle();
                bundle.putInt("position", position);
                intent.putExtras(bundle);
                startActivity(intent);
            }
        });
    }

    private void initComponents() {
        listView = findViewById(R.id.list_view);
        arrayAdapter = new ArrayAdapter<>(ListActivity.this, android.R.layout.simple_list_item_1, UserRepository.findAll());
        listView.setAdapter(arrayAdapter);
    }
}