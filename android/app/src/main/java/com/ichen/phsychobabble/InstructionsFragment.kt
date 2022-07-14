package com.ichen.phsychobabble

import android.os.Bundle
import android.text.method.LinkMovementMethod
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment

class InstructionFragment: Fragment(R.layout.instructions_fragment) {

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ) = inflater.inflate(R.layout.instructions_fragment, container, false)

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        val instructionsText = view.findViewById<TextView>(R.id.instructions_text)
        instructionsText.movementMethod = LinkMovementMethod.getInstance()
        super.onViewCreated(view, savedInstanceState)
    }

    private fun finish() {
        activity?.supportFragmentManager?.beginTransaction()?.remove(this)?.commit();
    }
}