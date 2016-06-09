#!/usr/bin/env ruby

# Kevin Mendoza
# CSCI 465
# Project 2

print "Please enter word size: "

wordList        = File.readlines("./words")
wordSize        = gets.to_i
guesses         = 10
previousGuesses = Array.new
regex           = /^[a-z]$/
check           = true

if wordSize < 5
    wordSize = 5
end

if wordSize > 20
    wordSize = 20
end

wordList.delete_if {|w| w.length != wordSize}

while guesses != 0
    print "\nPrevious Guesses: "

    if previousGuesses.length == 0
        print "No Guesses\n"
    else
        print "#{previousGuesses.join(" ")}"
    end

    print "Remaining Guesses: " + guesses.to_s + "\n\n"

    if check == true
        print "_ " * wordSize + "\n\n"
    end

    print "Please enter a guess: "
    tempGuess = gets

    if tempGuess =~ regex
        while previousGuesses.each {|w| w.include? "#{tempGuess}"}
            puts "Already Guessed. Please enter a guess: "
            tempGuess = gets
        end
        previousGuesses << tempGuess
        guesses -= 1
    end

    while !(tempGuess =~ regex)
        print "Invalid entry. Please enter a guess: "
        tempGuess = gets
        if tempGuess =~ regex
            while previousGuesses.each {|w| w.include? "#{tempGuess}"}
                puts "Already Guessed. Please enter a guess: "
                tempGuess = gets
            end
            previousGuesses << tempGuess
            guesses -= 1
        end
    end

    wordList.each {|w|
        w.delete_if {(w.include? "#{tempGuess}") == true}
        check = true
    }

    if check == true
        break
    else
        check = false
        chosenWord = wordList[0]
    end

    guesses -= 1
end
