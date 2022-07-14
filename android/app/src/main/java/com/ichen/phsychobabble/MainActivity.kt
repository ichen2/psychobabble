package com.ichen.phsychobabble

import android.graphics.Color
import android.graphics.Typeface
import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.appcompat.app.AppCompatActivity
import androidx.constraintlayout.helper.widget.Carousel
import androidx.constraintlayout.motion.widget.MotionLayout
import androidx.core.os.bundleOf
import androidx.core.view.children
import androidx.drawerlayout.widget.DrawerLayout
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentTransaction
import androidx.fragment.app.add
import androidx.fragment.app.commit


val categories: List<Category> = listOf(
    Category("Change the Tone of a Disagreement", "CTD"),
    Category("Get Out of a Power Struggle", "GOPS"),
    Category("Set Healthy Boundaries", "SHB"),
    Category("Make Amends", "MA"),
    Category("Invite Your Mate to Connect", "I2C"),
    Category("Ask for Understanding", "AFU"),
    Category("Give Understanding", "GU"),
    Category("Own Your Part in the Problem", "OMPP")
)

val cMap: Map<String, Category> =
    categories.associateBy { category -> category.abbreviation }

val cards: List<Card> = listOf(
    Card("Help me understand.", listOf(cMap["CTD"], cMap["I2C"], cMap["GOPS"])),
    Card("What just happened?", listOf(cMap["CTD"], cMap["GU"], cMap["GOPS"])),
    Card("I have a request. (Pause and make sure your partner is listening. Then ask for what you need.)", listOf(cMap["GOPS"])),
    Card("Can you give me a few minutes to calm down?", listOf(cMap["CTD"])),
    Card("Please know my intentions are good.", listOf(cMap["MA"], cMap["I2C"])),
    Card("What's going on?", listOf(cMap["CTD"], cMap["I2C"], cMap["GU"])),
    Card("I don't understand but I want to.", listOf(cMap["CTD"], cMap["I2C"], cMap["GU"])),
    Card("How can I make it better", listOf(cMap["I2C"], cMap["GU"])),
    Card("Please use 'I statements.'", listOf(cMap["GOPS"], cMap["SHB"])),
    Card("I feel _____ (mad, sad, glad or scared.)", listOf(cMap["GOPS"], cMap["AFU"])),
    Card("Talk about how you feel, not what I did.", listOf(cMap["CTD"], cMap["GOPS"], cMap["SHB"])),
    Card("Are we getting hung up on details or on the wrong thing?", listOf(cMap["CTD"], cMap["GOPS"], cMap["I2C"])),
    Card("Can we stop and start over?", listOf(cMap["CTD"], cMap["GOPS"], cMap["I2C"])),
    Card("Less is more. Say less.", listOf(cMap["CTD"], cMap["SHB"])),
    Card("I'm hurting right now and I just need a little time/space.", listOf(cMap["GOPS"], cMap["SHB"], cMap["AFU"])),
    Card("I understand that you're upset right now.", listOf(cMap["CTD"], cMap["GU"])),
    Card("I see it really differently. Can you help me understand your perspective?", listOf(cMap["CTD"], cMap["GOPS"], cMap["SHB"], cMap["AFU"])),
    Card("What would a comporomise look like?", listOf(cMap["CTD"], cMap["GOPS"], cMap["I2C"])),
    Card("Where did you go? (Ask this if your partner feels emotionally distant or shut down.)", listOf(cMap["CTD"], cMap["GOPS"], cMap["GU"])),
    Card("It would help me if we could _____.", listOf(cMap["CTD"], cMap["GOPS"], cMap["I2C"])),
    Card("You look upset", listOf(cMap["CTD"], cMap["GOPS"], cMap["I2C"])),
    Card("You sound upset.", listOf(cMap["CTD"], cMap["GOPS"], cMap["I2C"])),
    Card("Low & slow (This is a reminder to speak slowly and in a low tone of voice.)", listOf(cMap["CTD"], cMap["GOPS"], cMap["SHB"])),
    Card("Can we rewind the tape?", listOf(cMap["CTD"], cMap["GOPS"], cMap["I2C"])),
    Card("You Are we caught in a power struggle? upset.", listOf(cMap["CTD"], cMap["GOPS"], cMap["I2C"])),
    Card("Can I give you some feedback?", listOf(cMap["GOPS"], cMap["SHB"])),
    Card("The story I tell myself is ____, and when I tell myself that story, I feel ____", listOf(cMap["CTD"], cMap["GOPS"], cMap["AFU"])),
    Card("What do you need?", listOf(cMap["CTD"], cMap["GOPS"], cMap["GU"])),
    Card("Please work with me.", listOf(cMap["CTD"], cMap["GOPS"], cMap["I2C"])),
    Card("I want to help you.", listOf(cMap["CTD"], cMap["GOPS"], cMap["I2C"])),
    Card("I want to hear you but I can't because of ____ (Your tone, your word choice, your facial expressions ,your body language.)", listOf(cMap["CTD"], cMap["GOPS"], cMap["SHB"])),
    Card("What works better for me is ____.", listOf(cMap["GOPS"], cMap["SHB"])),
    Card("I want to say yes, but I need to say no.", listOf(cMap["SHB"])),
    Card("I think we're stuck in an old pattern. Can we start over?", listOf(cMap["GOPS"], cMap["I2C"], cMap["SHB"])),
    Card("Your comment/question felt bad. Can you rephrase it in the form of an invitation?", listOf(cMap["CTD"], cMap["GOPS"], cMap["SHB"])),
    Card("I need to tell you something and I'd like for you to respond.", listOf(cMap["SHB"], cMap["I2C"])),
    Card("I need to tell you something and I'd like for you to not respond.", listOf(cMap["SHB"])),
    Card("Are you okay?", listOf(cMap["GU"], cMap["I2C"])),
    Card("I can see that my part of what happened is: ____.", listOf(cMap["OMPP"], cMap["CTD"], cMap["GOPS"])),
    Card("I can't. I don't have the emotional bandwidth right now.", listOf(cMap["SHB"])),
    Card("Can we take a time out? (Say the amount of time you need to take: 5 mins, 1 hour, the rest of the evening.)", listOf(cMap["CTD"], cMap["GOPS"], cMap["SHB"])),
    Card("I would love it if we could ____.", listOf(cMap["CTD"], cMap["GOPS"], cMap["SHB"])),
    Card("I know your intentions are good.", listOf(cMap["GU"], cMap["I2C"])),
    Card("Can I offer a thought on that?", listOf(cMap["I2C"], cMap["SHB"])),
    Card("Is this a good time to talk?", listOf(cMap["I2C"], cMap["SHB"])),
    Card("How do you feel about that?", listOf(cMap["GU"], cMap["CTD"], cMap["GOPS"])),
    Card("I'd like to connect with you.", listOf(cMap["I2C"])),
    Card("I feel disconnected from you right now.", listOf(cMap["I2C"], cMap["CTD"], cMap["GOPS"])),
    Card("Let me think about how I'd like to respond to you.", listOf(cMap["CTD"], cMap["GOPS"], cMap["SBH"])),
    Card("Thank you.", listOf(cMap["CTD"], cMap["GOPS"], cMap["GU"], cMap["MA"])),
    Card("I'm sorry.", listOf(cMap["MA"], cMap["I2C"], cMap["CTD"], cMap["GOPS"])),
    Card("Can you use different words?", listOf(cMap["CTD"], cMap["GOPS"], cMap["SHB"])),
    Card("I'd be happy to but I can't right now.", listOf(cMap["AFU"])),
    Card("Can you say that again in a different way?", listOf(cMap["CTD"], cMap["GOPS"], cMap["SHB"], cMap["I2C"])),
    )

class MainActivity : AppCompatActivity() {

    var currentCategory: Category? = null
    lateinit var homeFragment: CarouselFragment

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        supportFragmentManager.commit {
            setReorderingAllowed(true)
            homeFragment = CarouselFragment()
            add(R.id.fragment_container, homeFragment)
        }

        // setup drawer layout
        val drawerLayout = findViewById<DrawerLayout>(R.id.drawer_layout)
        drawerLayout.setScrimColor(Color.TRANSPARENT)

        // setup hamburger button
        val header = findViewById<LinearLayout>(R.id.header)
        val hamburgerButton = findViewById<ImageView>(R.id.hamburger_button)
        hamburgerButton.setOnClickListener {
            if (drawerLayout.isOpen) drawerLayout.close() else drawerLayout.open()
        }

        // setup sidebar
        val sidebar = findViewById<LinearLayout>(R.id.sidebar)
        val home = findViewById<TextView>(R.id.home)
        home.setOnClickListener {
            for(fragment in supportFragmentManager.fragments) {
                if(fragment.javaClass != CarouselFragment::class.java) {
                    supportFragmentManager.commit {
                        remove(fragment)
                    }
                }
            }
            homeFragment.refresh()
            header.setBackgroundColor(resources.getColor(R.color.teal))
            hamburgerButton.setColorFilter(resources.getColor(R.color.white))
            drawerLayout.closeDrawers()
        }
        val quickGuide = findViewById<TextView>(R.id.quick_guide)
        quickGuide.setOnClickListener {
            for(fragment in supportFragmentManager.fragments) {
                if(fragment.javaClass != CarouselFragment::class.java) {
                    supportFragmentManager.commit {
                        remove(fragment)
                    }
                }
            }
            val fragment = InstructionFragment()
            supportFragmentManager.commit {
                setReorderingAllowed(true)
                add(R.id.fragment_container, fragment)
            }
            header.setBackgroundColor(resources.getColor(R.color.white))
            hamburgerButton.setColorFilter(resources.getColor(R.color.black))
            drawerLayout.closeDrawers()
        }
        val filters = findViewById<TextView>(R.id.filters)
        filters.setOnClickListener {
            for(fragment in supportFragmentManager.fragments) {
                if(fragment.javaClass != CarouselFragment::class.java) {
                    supportFragmentManager.commit {
                        remove(fragment)
                    }
                }
            }
            val fragment = FiltersFragment()
            supportFragmentManager.commit {
                setReorderingAllowed(true)
                add(R.id.fragment_container, fragment)
            }
            header.setBackgroundColor(resources.getColor(R.color.white))
            hamburgerButton.setColorFilter(resources.getColor(R.color.black))
            drawerLayout.closeDrawers()
        }
    }
}