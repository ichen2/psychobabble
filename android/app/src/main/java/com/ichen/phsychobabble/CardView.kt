package com.ichen.phsychobabble

import android.content.Context
import android.os.Bundle
import android.text.method.LinkMovementMethod
import android.util.AttributeSet
import android.view.*
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import androidx.constraintlayout.helper.widget.Carousel
import androidx.constraintlayout.motion.widget.MotionLayout
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.fragment.app.commit


class CardView(context: Context, attrs: AttributeSet): LinearLayout(context, attrs) {
    lateinit var card: Card
    lateinit var openCard: (Card) -> Unit
    private var flipped = false
    private val image = ImageView(context, attrs)
    private val text = TextView(context, attrs)

    init {
        image.layoutParams = LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT)
        image.setBackgroundResource(R.drawable.logo)
        addView(image)
    }

    fun initialize(card: Card, openCard: (Card) -> Unit) {
        this.card = card
        text.text = card.message
        this.openCard = openCard
    }
}

class CustomMotionLayout(context: Context, attrs: AttributeSet): MotionLayout(context, attrs) {

    private var isBeingClicked = false

    override fun onDragEvent(event: DragEvent?): Boolean {
        return super.onDragEvent(event)
    }

    override fun onTouchEvent(event: MotionEvent?): Boolean {
        val a = super.onTouchEvent(event)
        isBeingClicked = when(event?.action) {
            MotionEvent.ACTION_DOWN -> currentState != -1
            MotionEvent.ACTION_UP -> {
                if(isBeingClicked) {
                    val cardView = findViewById<CardView>(R.id.v2)
                    cardView.openCard(cardView.card)
                }
                false
            }
            else -> false
        }
        return a
    }
}

class CardFragment: Fragment(R.layout.card_fragment) {

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.card_fragment, container, false)
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        val message = requireArguments().getString("message")
        val messageText = view.findViewById<TextView>(R.id.message)
        messageText.text = message?.uppercase()
        val header = activity?.findViewById<LinearLayout>(R.id.header)
        val hamburgerButton = activity?.findViewById<ImageView>(R.id.hamburger_button)
        val closeText = view.findViewById<TextView>(R.id.close)
        closeText.setOnClickListener {
            val fragment = this
            activity?.supportFragmentManager?.commit {
                remove(fragment)
            }
            header?.setBackgroundColor(resources.getColor(R.color.teal))
            hamburgerButton?.setColorFilter(resources.getColor(R.color.white))
        }
        super.onViewCreated(view, savedInstanceState)
    }

    private fun finish() {
        activity?.supportFragmentManager?.beginTransaction()?.remove(this)?.commit();
    }
}