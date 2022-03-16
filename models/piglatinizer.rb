class PigLatinizer
    #=> ("pork") ("orkpay")
    #=> ("I") ("Iway")
    #=> ("spray") ("ayspray")
    #=> ("prays") ("ayspray")

    # expects to be passed a sentence, calls #piglatinize_each for word in sentence
    def piglatinize(str)
        # receiver.split(" ") 1. IF space, splits at space then shovel to array 2. IF NO space, shovel into array as-is 
        str.split(" ").map {|word| piglatinize_each(word) }.join(" ")
    end

    # re-scope below to Class
    private

    def vowel?(char)
        "AaEeIiOoUu".include?(char) ? true : false
    end

    # expects a whole word passed from #piglatinize
    def piglatinize_each(word)
        if vowel?(word[0])
            word + "way"
        else 
            # locate vowel's index
            vowel_location = word.index(/[AaEeIiOoUu]/)
            # grab everything before vowel
            before_vowel = word.slice(0..vowel_location-1)
            # grab vowel and everything after
            vowel_and_after = word.slice(vowel_location..word.size)
            # combine
            vowel_and_after + before_vowel + "ay"
        end
    end

end