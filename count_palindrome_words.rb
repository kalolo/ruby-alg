def count_palindrome(words)
  return 0 unless words

  anagrams = 0
  words.downcase.split(' ').each do |word|
    anagrams += 1 if word == word.reverse
  end
  
  anagrams
end


p count_palindrome("Madam Arora teaches malayalam")
p count_palindrome("some words just to test this")
p count_palindrome(" ")
p count_palindrome(nil)
