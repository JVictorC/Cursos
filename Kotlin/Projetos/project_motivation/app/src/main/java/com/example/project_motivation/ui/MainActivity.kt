package com.example.project_motivation.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.core.content.ContextCompat
import com.example.project_motivation.infra.MotivationConstants
import com.example.project_motivation.R
import com.example.project_motivation.data.Mock
import com.example.project_motivation.infra.SecuredPrefereces
import com.example.project_motivation.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity(), View.OnClickListener {
    private lateinit var binding: ActivityMainBinding
    private var categoryId = MotivationConstants.FILTER.ALL

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)

        setContentView(binding.root)

        // Esconde Barra de Navegacao
        supportActionBar?.hide()

        binding.buttonNewPhase.setOnClickListener(this)
        binding.imageAll.setOnClickListener(this)
        binding.imageHappy.setOnClickListener(this)
        binding.imageSunny.setOnClickListener(this)

        handleUserName()
        handleFilter(binding.imageAll.id)


        handleSeletedPhrase()
    }

    override fun onClick(view: View) {
        if (view.id == R.id.button_new_phase) {
            handleSeletedPhrase()
        } else if (view.id in listOf(R.id.image_all, R.id.image_happy, R.id.image_sunny)) {
            handleFilter(view.id)
        }
    }

    private fun handleSeletedPhrase() {
        val phraseInScreen = binding.textPhrase
        phraseInScreen.text = Mock().getPhrase(categoryId).description
    }

    private fun handleFilter(viewId: Int) {
        val imageAll = binding.imageAll
        val imageHappy = binding.imageHappy
        val imageSunny = binding.imageSunny

        imageAll.setColorFilter(ContextCompat.getColor(this, R.color.dark_purple))
        imageHappy.setColorFilter(ContextCompat.getColor(this, R.color.dark_purple))
        imageSunny.setColorFilter(ContextCompat.getColor(this, R.color.dark_purple))

        when (viewId) {
            R.id.image_all -> {
                categoryId = MotivationConstants.FILTER.ALL
                imageAll.setColorFilter(
                    ContextCompat.getColor(
                        this,
                        R.color.white
                    )
                )

                handleSeletedPhrase()
            }
            R.id.image_happy -> {
                categoryId = MotivationConstants.FILTER.HAPPY
                imageHappy.setColorFilter(
                    ContextCompat.getColor(
                        this,
                        R.color.white
                    )
                )

                handleSeletedPhrase()
            }
            R.id.image_sunny -> {
                categoryId = MotivationConstants.FILTER.SUNNY

                imageSunny.setColorFilter(
                    ContextCompat.getColor(
                        this,
                        R.color.white
                    )
                )

                handleSeletedPhrase()
            }
        }

    }

    private fun handleUserName() {
        val nameUser = SecuredPrefereces(this).getString(MotivationConstants.KEY.USER_NAME)
        binding.textUserName.text = "Ola, $nameUser"
    }
}