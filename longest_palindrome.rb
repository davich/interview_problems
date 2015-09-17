# This is a linear time solution. Guaranteed to be 2N or fewer comparisons.
def longest_palindrome(str)
  palindrome_lengths = {}
  center = right = 0

  processed_str = str.gsub(/(\w|$)/, '~\1')
  0.upto (processed_str.length - 1) do |i|
    i_mirror = center - (i - center)
    if (right > i)
      palindrome_lengths[i] = [right-i, palindrome_lengths[i_mirror]].min
    else
      palindrome_lengths[i] = 0
    end
    palindrome_lengths[i] += 1 while (processed_str[i + 1 + palindrome_lengths[i]] == processed_str[i - 1 - palindrome_lengths[i]])

    if (i + palindrome_lengths[i] > right)
      center = i;
      right = center + palindrome_lengths[i];
    end
  end
  max = palindrome_lengths.values.max
  center_index = palindrome_lengths.key(max)

  str[(center_index - max)/2, max]
end


s = "FourscoreandsevenyearsagoourfaathersbroughtforthonthiscontainentanewnationconceivedinzLibertyanddedicatedtothepropositionthatallmenarecreatedequalNowweareengagedinagreahtcivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"

#s = "thisisabbaabbababy"
#s = "abanbab"
puts longest_palindrome(s)
