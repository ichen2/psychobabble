package com.ichen.phsychobabble

import androidx.constraintlayout.helper.widget.Carousel
import androidx.constraintlayout.motion.widget.MotionLayout
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.LinearLayout
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.fragment.app.commit

class CarouselFragment: Fragment(R.layout.carousel_fragment) {

    lateinit var carousel: Carousel
    var header: LinearLayout? = null
    var hamburgerButton: ImageView? = null

    fun openCard(card: Card) {
        val bundle = bundleOf("message" to card.message)
        val fragment = CardFragment()
        fragment.arguments = bundle
        activity?.supportFragmentManager?.commit {
            setReorderingAllowed(true)
            add(R.id.fragment_container, fragment)
        }
        header?.setBackgroundColor(resources.getColor(R.color.white))
        hamburgerButton?.setColorFilter(resources.getColor(R.color.black))
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ) = inflater.inflate(R.layout.carousel_fragment, container, false)

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        // setup carousel
        val currentCategory: Category? = (activity as MainActivity?)?.currentCategory
        val motionLayout = view.findViewById<MotionLayout>(R.id.motion_layout)
        carousel = view.findViewById<Carousel>(R.id.carousel)
        carousel.setAdapter(CarouselAdapter(cards.filter { card -> currentCategory == null ||  card.categories.contains(currentCategory) }) { card -> openCard(card) })
        header = activity?.findViewById<LinearLayout>(R.id.header)
        hamburgerButton = activity?.findViewById<ImageView>(R.id.hamburger_button)
        super.onViewCreated(view, savedInstanceState)
    }

    fun refresh() {
        val currentCategory: Category? = (activity as MainActivity?)?.currentCategory
        carousel.setAdapter(CarouselAdapter(cards.filter { card -> currentCategory == null ||  card.categories.contains(currentCategory) }) { card -> openCard(card) })
        carousel.refresh()
    }
}