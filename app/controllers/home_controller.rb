class HomeController < ApplicationController
  def index
		my_random_hash_1 = {1 => 'pete', 2 => 'sanjiv', 3 => 'jesse', 4 => 'nilay',5 => 'olav',6 => 'vibhu',7 => 'rohit'}
		my_random_hash_2 = {1 => 'jesse', 2 => 'nilay', 3 => 'pete', 4 => 'sanjiv',5 => 'vibhu',6 => 'olav',7 => 'rohit'}
		my_random_hash_3 = {1 => 'olav', 2 => 'jesse', 3 => 'sanjiv', 4 => 'pete',5 => 'nilay',6 => 'rohit',7 => 'vibhu'}
		my_random_hash_4 = {1 => 'rohit', 2 => 'olav', 3 => 'vibhu', 4 => 'nilay',5 => 'sanjiv',6 => 'jesse',7 => 'pete'}
		my_random_hash_5 = {1 => 'sanjiv', 2 => 'vibhu', 3 => 'nilay', 4 => 'olav',5 => 'rohit',6 => 'pete',7 => 'jesse'}
		my_random_hash_6 = {1 => 'vibhu', 2 => 'rohit', 3 => 'sanjiv', 4 => 'jesse',5 => 'pete',6 => 'olav',7 => 'nilay'}
		my_random_hash_7 = {1 => 'nilay', 2 => 'pete', 3 => 'olav', 4 => 'rohit',5 => 'jesse',6 => 'vibhu',7 => 'sanjiv'}

		my_picky_hash = {1 => my_random_hash_1, 2 => my_random_hash_2, 3 => my_random_hash_3, 4 => my_random_hash_4, 5 => my_random_hash_5, 6 => my_random_hash_6, 7 => my_random_hash_7}

		random_num = rand(7) + 1
		@my_hash = my_picky_hash[random_num]
  end

end
