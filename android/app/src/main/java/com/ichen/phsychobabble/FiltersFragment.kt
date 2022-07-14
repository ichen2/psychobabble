package com.ichen.phsychobabble

import android.os.Bundle
import android.text.method.LinkMovementMethod
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.LinearLayout
import androidx.fragment.app.Fragment
import androidx.fragment.app.commit

class FiltersFragment: Fragment(R.layout.filters_fragment) {

    var header: LinearLayout? = null
    var hamburgerButton: ImageView? = null

    fun onClick(category: Category?) {
        (activity as MainActivity?)?.currentCategory = category
        val fragment = this
        activity?.supportFragmentManager?.commit {
            remove(fragment)
        }
        header?.setBackgroundColor(resources.getColor(R.color.teal))
        hamburgerButton?.setColorFilter(resources.getColor(R.color.white))
        (activity as MainActivity?)?.homeFragment?.refresh()
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ) = inflater.inflate(R.layout.filters_fragment, container, false)

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        header = activity?.findViewById<LinearLayout>(R.id.header)
        hamburgerButton = activity?.findViewById<ImageView>(R.id.hamburger_button)
        view.findViewById<LinearLayout>(R.id.cttoad).setOnClickListener {
            onClick(cMap["CTD"])
        }
        view.findViewById<LinearLayout>(R.id.gooaps).setOnClickListener {
            onClick(cMap["GOPS"])
        }
        view.findViewById<LinearLayout>(R.id.shb).setOnClickListener {
            onClick(cMap["SHB"])
        }
        view.findViewById<LinearLayout>(R.id.ma).setOnClickListener {
            onClick(cMap["MA"])
        }
        view.findViewById<LinearLayout>(R.id.iymtc).setOnClickListener {
            onClick(cMap["I2C"])
        }
        view.findViewById<LinearLayout>(R.id.afu).setOnClickListener {
            onClick(cMap["AFU"])
        }
        view.findViewById<LinearLayout>(R.id.gu).setOnClickListener {
            onClick(cMap["GU"])
        }
        view.findViewById<LinearLayout>(R.id.oypitp).setOnClickListener {
            onClick(cMap["OMPP"])
        }
        super.onViewCreated(view, savedInstanceState)
    }
}