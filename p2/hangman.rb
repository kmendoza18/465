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
lastWord        = Array.new
finalDisplay    = Array.new

wordList.map! {|w| w.chomp}

if wordSize < 5
    wordSize = 5
end

if wordSize > 20
    wordSize = 20
end

wordList.delete_if {|w| w.length != wordSize}

for i in 0...wordSize
    finalDisplay[i] = "_"
end

while guesses != 0
    print "\nPrevious Guesses: "

    if previousGuesses.length == 0
        print "No Guesses\n"
    else
        print previousGuesses.join
    end

    print "Remaining Guesses: " + guesses.to_s + "\n\n"

    print "_ " * wordSize + "\n\n"

    print "Please enter a guess: "
    tempGuess = gets

    if tempGuess =~ regex
        previousGuesses.each {|w|
            while (w.include? ("#{tempGuess}"))
                puts "Already Guessed. Please enter a guess: "
                tempGuess = gets
            end
        }
        previousGuesses << tempGuess
        guesses -= 1
    end

    while !(tempGuess =~ regex)
        print "Invalid entry. Please enter a guess: "
        tempGuess = gets
        if tempGuess =~ regex
            previousGuesses.each {|w|
                while (w.include? ("#{tempGuess}"))
                    puts "Already Guessed. Please enter a guess: "
                    tempGuess = gets
                end
            }
            previousGuesses << tempGuess
            guesses -= 1
        end
    end

    if ((wordList.grep_v (/[#{tempGuess}]/)).size == 0)
        previousGuesses<<"\n"
        while guesses != 0
            tempGuess.chomp!
            found = false
            won = false
            for i in 0...wordSize
                if lastWord[i] == tempGuess
                    finalDisplay[i] = "#{tempGuess}"
                    found = true
                    if finalDisplay.join == lastWord.join
                        puts "You win"
                        won = true
                    end
                end
            end
            if found
                guesses += 1
            end
            if won
                puts "The word is " + finalDisplay.join
                exit
            end

            print "\n#{finalDisplay.join(" ")}\n"

            print "\nPrevious Guesses: "

            if previousGuesses.length == 0
                print "No Guesses\n"
            else
                print previousGuesses.join
            end

            print "\nRemaining Guesses: " + guesses.to_s + "\n\n"

            print "Please enter a guess: "
            tempGuess = gets

            if tempGuess =~ regex
                previousGuesses.each {|w|
                    while (w.include? ("#{tempGuess}"))
                        puts "Already Guessed. Please enter a guess: "
                        tempGuess = gets
                    end
                }
                previousGuesses << tempGuess
                #previousGuesses << "\n"
                guesses -= 1
            end

            while !(tempGuess =~ regex)
                print "Invalid entry. Please enter a guess: "
                tempGuess = gets
                if tempGuess =~ regex
                    previousGuesses.each {|w|
                        while (w.include? ("#{tempGuess}"))
                            puts "Already Guessed. Please enter a guess: "
                            tempGuess = gets
                        end
                    }
                    previousGuesses << tempGuess
                    #previousGuesses << "\n"
                    guesses -= 1
                end
            end

        end
    end

    wordList = wordList.grep_v (/[#{tempGuess}]/)

    wordList.each {|w|
        if (w !~ /[#{tempGuess}]/)
            check = false
        end
    }

    if check == false
        chosenWord = wordList[0]
        chosenWord = chosenWord.split(%r{})
        lastWord = chosenWord
        if ((wordList.grep_v (/[#{tempGuess}]/)).size == 0)
            break
        end
    end

    if guesses == 0
        puts "You Lose"
        puts "The word was " + lastWord.join
        break
    end
end
