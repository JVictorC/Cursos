package com.example.project_motivation.ui

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import com.example.project_motivation.infra.MotivationConstants
import com.example.project_motivation.R
import com.example.project_motivation.infra.SecuredPrefereces
import com.example.project_motivation.databinding.ActivityUserBinding

class UserActivity : AppCompatActivity(), View.OnClickListener {
    lateinit var binding: ActivityUserBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityUserBinding.inflate(layoutInflater)

        supportActionBar?.hide()

        setContentView(binding.root)

        binding.buttonSavedNameUser.setOnClickListener(this)

        verifyUserInStorage()
    }

    override fun onClick(view: View) {
        if (view.id == R.id.button_saved_name_user) {
            handleSaved()
        }
    }

    private fun handleSaved() {
        val value = binding.editNameUser.text.toString()

        if (value.isEmpty()) {
            Toast.makeText(
                this,
                R.string.validation_mandatory_name,
                Toast.LENGTH_SHORT
            ).show()
            return;
        }

        SecuredPrefereces(this).storeString(MotivationConstants.KEY.USER_NAME, value)

        startActivity(Intent(this, MainActivity::class.java))
        finish()
    }


    private fun verifyUserInStorage() {
        val user = SecuredPrefereces(this).getString(MotivationConstants.KEY.USER_NAME);

        if(user.isNotEmpty()) {
            startActivity(Intent(this, MainActivity::class.java))
            finish()
        }
    }
}