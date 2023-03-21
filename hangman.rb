# Define the list of words for the game
words = ["buzz", "lynx", "jinx", "jazz", "jazzy", "muzziness", "zigzagging", "jars", "junk", "mummifying", "grogginess"]

# Select a random word from the list
word = words.sample

# Define the initial state of the game
max_guesses = 6
missed_guesses = 0
letters_guessed = []
hidden_word = "_" * word.length

# Loop until the game ends
loop do
  # Display the current state of the game
  puts "Missed Guesses: #{missed_guesses}/#{max_guesses}"
  puts "Letters Guessed: #{letters_guessed.join(", ")}"
  puts hidden_word

  # Prompt the player to enter a guess
  print "Enter a letter: "
  guess = gets.chomp.downcase

  # Check if the player has already guessed the letter
  if letters_guessed.include?(guess)
    puts "You've already guessed that letter. Try again."
    next
  end

  # Add the guessed letter to the list of letters guessed
  letters_guessed << guess

  # Check if the guessed letter is in the word
  if word.include?(guess)
    # Replace the underscore in the hidden word with the guessed letter
    word.split("").each_with_index do |letter, index|
      if letter == guess
        hidden_word[index] = guess
      end
    end

    # Check if the player has guessed the entire word
    if hidden_word == word
      puts "Congratulations! You guessed the word '#{word}'!"
      break
    end
  else
    # Increment the missed guesses counter
    missed_guesses += 1

    # Check if the player has used all their guesses
    if missed_guesses == max_guesses
      puts "Sorry, you didn't guess the word '#{word}'. Better luck next time!"
      break
    end
  end
end
