package com.ichen.phsychobabble

import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.constraintlayout.helper.widget.Carousel
import androidx.core.view.children

class CarouselAdapter(var data: List<Card>, val onClick: (card: Card) -> Unit): Carousel.Adapter {
    override fun count(): Int = data.size
    override fun populate(view: View?, index: Int) {
        val image: ImageView? =
            ((view as ViewGroup).children.toList().filter { child -> child is ImageView }
                .getOrNull(0) as ImageView?)
        val text: TextView? =
            ((view as ViewGroup).children.toList().filter { child -> child is TextView }
                .getOrNull(0) as TextView?)
        (view as CardView).initialize(data[index]) { card -> onClick(card) }
    }
    override fun onNewItem(index: Int) {

    }
}