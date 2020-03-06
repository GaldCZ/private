import random
import json

with open('data.json') as f:
  data = json.load(f)

p_one_name = data['players'][0]['one']
p_two_name = data['players'][0]['two']
#p_one_name = input("Player 1 name:\n")
#print("Second:")
#p_two_name = input("Player 2 name:\n")

numberList = ["rock","scissors","paper"]
p_one = random.choice(numberList)
p_two = random.choice(numberList)
print(p_one_name + " = " + p_one + "...." + p_two_name + " = " + p_two)

if p_one == p_two:
	print("draw")
	winner = "Nobody"
	player = "draw"

#rock	
if p_one == "rock" and p_two == "scissors":
	winner = p_one_name
	player = "one"
if p_one == "rock" and p_two == "paper":
	winner = p_two_name
	player = "two"
#scissors
if p_one == "scissors" and p_two == "rock":
	winner = p_two_name
	player = "two"
if p_one == "scissors" and p_two == "paper":
	winner = p_one_name
	player = "one"
#paper
if p_one == "paper" and p_two == "rock":
	winner = p_one_name
	player = "one"
if p_one == "paper" and p_two == "scissors":
	winner = p_two_name
	player = "two"

print(winner + " WON !!! ")	


prev_value = data['results'][0][player]
data['results'][0][player] = prev_value + 1

with open("data.json", "w")  as jsonFile:
	json.dump(data, jsonFile)