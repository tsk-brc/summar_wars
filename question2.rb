=begin
  p=37, q=71, e=79としてRSA暗号を作成した。暗号文が「904」であるとき、元の文章は？
  ただし、条件は以下の通りとする。
  ・pq=nである。
  ・m(p - 1)(q - 1) = -1(mod e)となるような最小の自然数mを用意すると、d = (m(p - 1)(q - 1) + 1) / e　である
  ・暗号文cについて、c^d = M(mod n)を計算することで、元の文章を数字に変換した文が得られる
=end
p = 37
q = 71
e = 79
c = 904

n = p * q
m = 1

m += 1 until 2520 * m % 79 == 78

d = (m * (p - 1) * (q - 1) + 1) / e
M = c**d % n

s = ''
(M.to_s.length / 2).times do |num|
  s << ('A'..'Z').map(&:to_s)[M.to_s[2 * num, 2].to_i - 1]
end
puts s
