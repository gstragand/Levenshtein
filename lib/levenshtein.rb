class Levenshtein

  def compare(s1, s2)
    s1_len = s1.size
    s2_len = s2.size

    return 0 if 0 == s2_len || 0 == s1_len

    #Define and seed matrix
    matrix = Array.new(s1_len + 1).map! {
      Array.new(s2_len + 1).map! {
        0
      }
    }
    (s1_len + 1).times { |i| matrix[i][0] = i }
    (s2_len + 1).times { |i| matrix[0][i] = i }

    for i in 1..s1_len
      c = s1[i - 1]
      for j in 1..s2_len
        cost = (c == s2[j - 1]) ? 0 : 1
        matrix[i][j] = [ matrix[i - 1][j] + 1, matrix[i][j - 1] + 1, matrix[i - 1][j - 1] + cost].min
      end
    end

    return (1.0 - (matrix[s1_len][s2_len] / Float([s1_len, s2_len].max)))
  end

end