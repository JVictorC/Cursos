package com.example.project_motivation.infra

import android.content.Context
import android.content.SharedPreferences

class SecuredPrefereces(context: Context) {

    private val security: SharedPreferences = context.getSharedPreferences(
        "Motivation",
        Context.MODE_PRIVATE
    )


    fun storeString(key: String, value: String) {
        security.edit().putString(key, value).apply()
    }

    fun getString(key: String): String {
        // o Segundo parametro seria caso eu nao encontrar nada no Storage
        return security.getString(key, "") ?: ""
    }
}