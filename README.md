# hackathon-nftberlin
The purpose of this project is to produce a unique audio-visual / representation of the signature / signature of an Urbit adress.
It takes the two words eg "master" "masrze" (or 4 sigils 'mas','ter','mas','rze') as input,
and creates a combined output :
- a graphical colored representation of the planet
- a sequence of sounds

Both sound and image are one-to-one unique, making it less error-prone.
Only one of the two digital media is enough to verify the signature, even though theoritical.

It uses following components:
- https://processing.org/ for the 3D modeling and audio generation

Unicity is achieved by combining prefixes-suffixes to generate one wave/chord.
For the graphical part, we use a combination of (subject to change)
- Color, rotational speed, rotational angle, lightning angle.
For the sound, we use a use a chord in C Major scale

To do list / Next Steps :
- Attach Urbit documents and sigils doc
- Sounds adds accessibility
- Add Star background
- Make it match the stars/planets galaxy constellation

How to use:
Type sigils , press enter.

How to run it TBD

*screenshots*

before input
https://media.discordapp.net/attachments/979652228019277829/980015040398778398/Screenshot_2022-05-28_at_09.47.09.png?width=771&height=606

master-master
![Image](https://media.discordapp.net/attachments/979652228019277829/979850260274880552/Screenshot_2022-05-27_at_22.41.49.png?width=774&height=606)

satsur-pocmel
![Image](https://media.discordapp.net/attachments/979652228019277829/979850420602175538/Screenshot_2022-05-27_at_22.55.37.png?width=770&height=606)

What is Urbit ID?
Urbit ID is a decentralized address space infrastructure designed for Urbit OS. Urbit ID is the Identity system of Urbit, consisting of 2^32 (4.294.967.296) unique identities. Urbit IDs are distributed hierarchically. At the top of this hierarchy there are 2^8 (256) galaxies. Each galaxy issues 2^8 stars, making a total of 2^16 (65K). Stars then each can issue 2^16 planets, making for a total of 2^32 (~4B). Each of the identities has its own point on the network, its Azimuth point and a corresponding unique pronounceable name with a tilde before it, like: ~wolref-podlex. Galaxies can be found at the first 256 points, Galaxy ~zod is for example azimuth point 0, the Stars that are spawned under a galaxy are placed from point 256 onwards Planets are the 4 billion points from 65.536. If we look at the table below we can identify that ~wolref-podlex is a planet and its Azimuth point is 4.880.309. You can find out more about Urbit IDs here https://urbit.org/understanding-urbit/urbit-id and you can look up all the information about specific Urbit IDs and their parent here https://urbit.live/.

| Tree | Amount | Example name | Azimuth point |
| -- | -- | -- | -- |
| Galaxies|2^8 (256)|~zod|0|
|Stars|~2^16 (65.280)|~barwet|46.949|
|Planets|~2^32 (4.294.901.760)|~wolref-podlex|4.880.309|

### Urbit names

Besides the Azimuth points, all Urbit IDs have a pronounceable name composed of fragments of three letters that are referred to as syllables. ~zod is a galaxy and consists of one syllable, a star like ~barwet is composed of two syllables and a planet of four syllables. In total there are 512 unique syllables that can be divided in prefixes and suffixes 2^8 (256) each. A galaxy only uses a suffix while any combination of two or more syllables is built with prefixes and suffixes. Example: ~zod ~barwet ~wolref-podlex

A more extensive explanation of Urbit phonetic names and their relation to the numerical addresses on the network can be found [here](https://blog.urbit.live/an-intro-to-urbit-names/).

At the end of the doc there is a list of all prefixes and suffixes.

#### Sigils

At this moment @p's are visualized via Urbit's sigils that create different shapes for prefixes and suffixes and combine them into a unique visual representation of the @p. Below you can find an example of the three visual representations.

![](https://lh3.googleusercontent.com/lRht9jE7a0WVYwb3rvZRfqbfMi0RjJ7ZYCiIvqUj74BcD0kGW9UG4vw3-ho4Ms87zuWjpp_jwA9NW5mU-yGShSRfmnEDvBnVcCe1VO4GO__I76C3GzC0FNsShX2K3jrs-JusTLqh76r-dlbWZg)![](https://lh5.googleusercontent.com/nA1Zy0rHvfVxoz64Ei49xJP-HEeSvi_GxlMTL60Y6Ahk9Vi1wWLoHH9HsMQoPWdLaPKGjYxdtuC7_l_PnL4yb7KE8F5zlM9u3KBGkKfFOyC04pl8qdYYjtqDjxw8DxyP2nk1udNBb3txPLo1Jg)![](https://lh3.googleusercontent.com/Ydvm5RskLSj2Ttwxt7884Zx7xOUjxPpoAwQcGikIfTAOlKbgd6ZZuWnD1-w93_Ogj1X5qzkKyy4zI8Ej8i8J5f8AZSFETPywiCW37XtegfXOs8fNfCzBdob4-Xtr4_mtuqiWnknmyxY2KEhQxQ)

~zod            ~barwet           ~wolref-podlex\
More information about how sigils are created and the rationale behind it is [here](https://urbit.org/blog/creating-sigils). The rarity of shapes and combinations can be found [here](https://urbit.me/about/rarest-urbit-sigils).

Technical resources
===================

-   [Javascript library of relation between numbers and @ps](https://github.com/urbit/urbit-ob/)

-   [Hoon library of relation between numbers and @ps](https://github.com/urbit/urbit/blob/master/pkg/arvo/sys/hoon.hoon)
