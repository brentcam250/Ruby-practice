
#take in an array of prices, return the biggest jump in price aka best days to purchase and sell.
#stated another way, find the min,max pair where the index of min in the array is lower than the index of max
def stock_picker (prices)
  best_pair = [0,1]
  buy_day = 0
  sell_day = 1
  profit = 0
  prices.each_with_index do |price, index|
    #for every price, we want to check the subarray that begins at index, and goes to the end to find the maximum price.
    for i in index..prices.length-1
      if(prices[i] - prices[index] > profit)
        profit = (prices[i] - prices[index])
        buy_day = index
        sell_day = i
        #puts "new high of $#{profit} for days buying on day:#{index} with a price of $#{prices[index]} and selling on day:#{i} for a price of $#{prices[i]}"
      end
    end
  end
  return [buy_day, sell_day]
end

prices = [17,3,6,9,15,8,6,1,10]
#prices = [17,3,6,9,15,8,6,1,10,100,200,3400,0,3399,3400]
result = stock_picker(prices)
p result