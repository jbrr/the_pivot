Candidate.create(name: "Donald Trump", party: "Republican", bio: "Was born in the most luxurious crib the world has ever seen, in the most luxurious presidential suite in the universe. Puts his name on everything he owns, now wants to put his name on the White House.", featured: true, last_name: "trump")

Candidate.create(name: "Jeb Bush", party: "Republican", bio: "Born under a bush. Father sent him to live with the bush people until he was old enough to take over the family business selling shrubberies. Eventually became Governor of Florida. As president, wants to make sure that every American can afford to put a bush on their front lawn.", last_name: "bush")

Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Mr. Cruz was born to immigrant parents, whom he promptly reported to INS. Cruz grew up idolizing Dobby The House Elf from Harry Potter, and underwent many plastic surgeries to shape himself in Dobby's image. As President of the United States, Cruz wants to every American to be a 'Very proud wacko bird' just like him.", last_name: "cruz")

Candidate.create(name: "Hillary Clinton", party: "Democratic", bio: "Ms. Clinton was brought into spontaneous existence due to complex interactions between scripts on her parents' personal email server. As the pioneering robotic overlady of the human race, she (it?) strives to bridge a peaceful connection between human and robotic civilizations.", featured: true, last_name: "clinton")

Candidate.create(name: "Bernie Sanders", party: "Democratic", bio: "Mr. Sanders is descended from a long line of Keebler elfs, but chose break off from family tradition to make sure that even America's poorest residents have a pantry full of Keebler Fudge Stripes. Legend has it that the more disheveled his appearance, the greater his power.", featured: true, last_name: "sanders")

Candidate.create(name: "Joe Biden", party: "Democratic", bio: "While not officially running, Joe Biden's ambitions to show America 'where the party's at' are clear. Born to humble bartenders, Biden quickly endeared himself to the local patrons of 'Shotgun Joe's,' his namesake. His social acumen prompted a drunken patron one day to suggest that he run for public office. Biden, with Cheshire Cat smile, shook off his 11am buzz, and stumbled into the office of the Vice President. He looks to repeat this success in the 2016 election.", last_name: "biden")
puts "Candidates created"
Issue.create(topic: "Marriage Equality", description: "The central argument in the upcoming debates will be quite simple. Kim Davis vs. humans marrying sheep. Discuss.", picture: 'marriage')

Issue.create(topic: "Environment", description: "Set to be a hotly contested issue, candidates will debate whether climate change is a hoax or if the world is set to end in 20 years time.", featured: true, picture: 'environment')

Issue.create(topic: "Immigration", description: "Some candidates insist that their families materialized from America's soil, never to have experienced immigration, while others would like to open Lady Liberty's arms to the masses.", featured: true, picture: 'immigration')

Issue.create(topic: "ISIS", description: "We can already hear the arguments unfolding and the debates haven't started. Republican: 'In conjunction with sharing our deep held values of A-MUR-I-CA, cheeseburgers included, we are making great progress against ISIS with every drone strike. They're the best!' Democrats: 'No no no, drone attacks are the work of the devil! We should sit down to a nice lunch with their leader and discuss these issues like adults.'", picture: 'isis')

Issue.create(topic: "Gun Control", description: "'Let them have guns!,' some politicians might yell, channeling their inner Marie Antoinettes, while others will argue that prison rules should apply - anything that can be used as a weapon, should be illegal. Please ask yourself, would you like to own an AK47 or would you like to eat with your hands?", picture: 'guns')

Issue.create(topic: "Economy", description: "The hard working, and deserving, 1 per-centers are the way of the future according to some. Others envision a single world commune where everyone's opinion is equally important.", featured: true, picture: 'economy')
puts "Issues Created"

CandidateIssue.create(stance: "Only the most luxuriously dressed grooms/brides will be allowed to wed each other.", candidate_id: 1, issue_id: 1)

CandidateIssue.create(stance: "All trees should be gilded.", candidate_id: 1, issue_id: 2)

CandidateIssue.create(stance: "We're gonna make a giant sea wall to keep out all the illegal Chinese, and we're gonna make Mexico pay for it!", candidate_id: 1, issue_id: 3)

CandidateIssue.create(stance: "Kill 'em all!", candidate_id: 1, issue_id: 4)

CandidateIssue.create(stance: "Gold guns for everyone, with diamond bullets.", candidate_id: 1, issue_id: 5)

CandidateIssue.create(stance: "I'll run America like one my many, many, many, many successful bankrupt businesses.", candidate_id: 1, issue_id: 6)

CandidateIssue.create(stance: "Only homosexual and bi-curious shrubberies will be permitted the right to marry the plant they love.", candidate_id: 2, issue_id: 1)

CandidateIssue.create(stance: "Global warming puts all of us in danger, but most importantly the indigenous bush people. Haliburton will be given a no-bid multi-billion dollar contract to protect the bush people's dwinding habitat and general livelihood.", candidate_id: 2, issue_id: 2)

CandidateIssue.create(stance: "Latin American bushes will be allowed to seek asylum at nurseries around the nation.", candidate_id: 2, issue_id: 3)

CandidateIssue.create(stance: "We will earn favor with ISIS by welcoming them to the neighborhood with well manicured bushes. Either that or nuke them?", candidate_id: 2, issue_id: 4)

CandidateIssue.create(stance: "All guns will be banned from use for US Citizens inside and outside our nation. The gratuitous and horrific murder of Cecil the bush has raised awareness to our serious gun problem and made action on this issue a cornerstone of my platform.", candidate_id: 2, issue_id: 5)

CandidateIssue.create(stance: "I will measure the strength of our economy by whether all Americans have the opportunity to provide their family with numerous bushes and shrubberies from the nursery of thie choice.", candidate_id: 2, issue_id: 6)

CandidateIssue.create(stance: "Only straight men and women deserve the 50% chance of becoming divorced after marriage, just like God intended.", candidate_id: 3, issue_id: 1)

CandidateIssue.create(stance: "We will bend Mother Nature to our will. I'm thinking of something analogous to the evil corporation from James Cameron's 'Avatar.'", candidate_id: 3, issue_id: 2)

CandidateIssue.create(stance: "Now that I made it here in America, no one else is allowed in. That's fair right?", candidate_id: 3, issue_id: 3)

CandidateIssue.create(stance: "Our young, brave American soldiers are ready and willing to take on ISIS, an existential threat to our nation. Just not my kids. Or my friends' kids.", candidate_id: 3, issue_id: 4)

CandidateIssue.create(stance: "Why does rambo get to have all the fun?", candidate_id: 3, issue_id: 5)

CandidateIssue.create(stance: "Our economy does best when government gets out of the way. That's why we need to cut all funding for building public roads and public schools to bring America back to greatness.", candidate_id: 3, issue_id: 6)


CandidateIssue.create(stance: "All Americans deserve to have a husband that embarrasses them on national television multiple times.", candidate_id: 4, issue_id: 1)

CandidateIssue.create(stance: "The precedent of imminent domain will be used to relocate the residents of Alaska elsewhere to make way for the worlds largest polar bear sanctuary.", candidate_id: 4, issue_id: 2)

CandidateIssue.create(stance: "All undocumented immigrants should be given voting rights so the demographics shift in my favor and ensure a second term as president.", candidate_id: 4, issue_id: 3)

CandidateIssue.create(stance: "I plan to continue my predecessor's campaign of mostly indiscriminate drone attacks.", candidate_id: 4, issue_id: 4)

CandidateIssue.create(stance: "I plan to implement a Chris Rock-inspired policy on firearms: guns are free but bullets cost $10,000 each.", candidate_id: 4, issue_id: 5)

CandidateIssue.create(stance: "To ensure a strong economy we need to invest in our public schools. All Americans should feel good about sending their kids to our nation's public institution. Except Chelsea. I'll be damned if my grandchildren go to school with the proletariat.", candidate_id: 4, issue_id: 6)

CandidateIssue.create(stance: "The human race is a plague on our planet, extermination is the only reasonable course of action.", candidate_id: 5, issue_id: 2)

CandidateIssue.create(stance: "Let's invite them all to a round table discussion.", candidate_id: 5, issue_id: 4)

CandidateIssue.create(stance: "Folks, I can tell you I've known eight presidents, three of them intimately. Free love baby.", candidate_id: 6, issue_id: 1)

CandidateIssue.create(stance: "I might not be as crazy as my man Bernie, but I support all the fuzzy creatures in this world.", candidate_id: 6, issue_id: 2)

CandidateIssue.create(stance: "This is the dullest audience I have ever spoken to. Just sitting there, staring at me. Pretend you like me!", candidate_id: 6, issue_id: 3)

CandidateIssue.create(stance: "This is a big f**king deal!", candidate_id: 6, issue_id: 4)

CandidateIssue.create(stance: "I don't want to see any of those pretty lasses get hurt. Lock up those guns!", candidate_id: 6, issue_id: 5)

CandidateIssue.create(stance: "Look, those other guys' last-minute economic plans do nothing to tackle the number-one job facing the middle class, and it happens to be, as Barack says, a three-letter word: jobs. J-O-B-S, jobs.", candidate_id: 6, issue_id: 6)

CandidateIssue.create(stance: "Pick anyone or anything!", candidate_id: 5, issue_id: 1)
puts "Candidate Issues Created"

candidate_issue1 = CandidateIssue.create(stance: "I, frankly, do not believe that we should be bringing in significant numbers of unskilled to workers to compete with our kids. Make 'em all citizens!", candidate_id: 5, issue_id: 3)

candidate_issue2 = CandidateIssue.create(stance: "Eh, what do you think? I could go either way.", candidate_id: 5, issue_id: 5)

candidate_issue3 = CandidateIssue.create(stance: "I'm the Friar Tuck to my Robin Hood economic plan. I'm just here to make the rich hand over their extra money to you average people.", candidate_id: 5, issue_id: 6)

user1 = User.create(first_name: "Travis", last_name: "Haby", email: "big_head@gmail.com", username: "habybaby", password: "password", password_confirmation: "password")

user2 = User.create(first_name: "Mimi", last_name: "Schatz", email: "heyo@gmail.com", username: "meems", password: "password", password_confirmation: "password")

user3 = User.create(first_name: "Rose", last_name: "Kohn", email: "rose@gmail.com", phone_number: "3016933081", username: "rose", password: "password", password_confirmation: "password")
puts "Users created"

order1 = Order.create(total: 420, user_id: user1.id, status: "completed")

Donation.create(amount: 210, candidate_issue_id: candidate_issue1.id, user_id: user1.id, order_id: order1.id)

Donation.create(amount: 210, candidate_issue_id: candidate_issue2.id, user_id: user1.id, order_id: order1.id)

order2 = Order.create(total: 2000, user_id: user1.id, status: "pending")

Donation.create(amount: 900, candidate_issue_id: candidate_issue3.id, user_id: user1.id, order_id: order2.id)

Donation.create(amount: 1100, candidate_issue_id: candidate_issue2.id, user_id: user1.id, order_id: order2.id)

order3 = Order.create(total: 500, user_id: user1.id, status: "completed")

Donation.create(amount: 240, candidate_issue_id: candidate_issue1.id, user_id: user1.id, order_id: order3.id)

Donation.create(amount: 260, candidate_issue_id: candidate_issue2.id, user_id: user1.id, order_id: order3.id)

order4 = Order.create(total: 40, user_id: user1.id, status: "cancelled")

Donation.create(amount: 20, candidate_issue_id: candidate_issue1.id, user_id: user1.id, order_id: order4.id)

Donation.create(amount: 10, candidate_issue_id: candidate_issue2.id, user_id: user1.id, order_id: order4.id)

Donation.create(amount: 10, candidate_issue_id: candidate_issue3.id, user_id: user1.id, order_id: order4.id)

order5 = Order.create(total: 3000, user_id: user1.id, status: "cancelled")

Donation.create(amount: 2000, candidate_issue_id: candidate_issue1.id, user_id: user1.id, order_id: order5.id)

Donation.create(amount: 1000, candidate_issue_id: candidate_issue2.id, user_id: user1.id, order_id: order5.id)

order6 = Order.create(total: 420, user_id: user2.id, status: "completed")

Donation.create(amount: 210, candidate_issue_id: candidate_issue1.id, user_id: user2.id, order_id: order6.id)

Donation.create(amount: 210, candidate_issue_id: candidate_issue2.id, user_id: user2.id, order_id: order6.id)

order7 = Order.create(total: 2000, user_id: user2.id, status: "pending")

Donation.create(amount: 900, candidate_issue_id: candidate_issue3.id, user_id: user2.id, order_id: order7.id)

Donation.create(amount: 1100, candidate_issue_id: candidate_issue2.id, user_id: user2.id, order_id: order7.id)

order8 = Order.create(total: 500, user_id: user2.id, status: "completed")

Donation.create(amount: 240, candidate_issue_id: candidate_issue1.id, user_id: user2.id, order_id: order8.id)

Donation.create(amount: 260, candidate_issue_id: candidate_issue2.id, user_id: user2.id, order_id: order8.id)

order9 = Order.create(total: 40, user_id: user2.id, status: "cancelled")

Donation.create(amount: 20, candidate_issue_id: candidate_issue1.id, user_id: user2.id, order_id: order9.id)

Donation.create(amount: 10, candidate_issue_id: candidate_issue2.id, user_id: user2.id, order_id: order9.id)

Donation.create(amount: 10, candidate_issue_id: candidate_issue3.id, user_id: user2.id, order_id: order9.id)

order10 = Order.create(total: 3000, user_id: user2.id, status: "cancelled")

Donation.create(amount: 2000, candidate_issue_id: candidate_issue1.id, user_id: user2.id, order_id: order10.id)

Donation.create(amount: 1000, candidate_issue_id: candidate_issue2.id, user_id: user2.id, order_id: order10.id)

order11 = Order.create(total: 420, user_id: user3.id, status: "pending")

Donation.create(amount: 210, candidate_issue_id: candidate_issue1.id, user_id: user3.id, order_id: order11.id)

Donation.create(amount: 210, candidate_issue_id: candidate_issue2.id, user_id: user3.id, order_id: order11.id)

order12 = Order.create(total: 2000, user_id: user3.id, status: "completed")

Donation.create(amount: 900, candidate_issue_id: candidate_issue3.id, user_id: user3.id, order_id: order12.id)

Donation.create(amount: 1100, candidate_issue_id: candidate_issue2.id, user_id: user3.id, order_id: order12.id)

order13 = Order.create(total: 500, user_id: user3.id, status: "completed")

Donation.create(amount: 240, candidate_issue_id: candidate_issue1.id, user_id: user3.id, order_id: order13.id)

Donation.create(amount: 260, candidate_issue_id: candidate_issue2.id, user_id: user3.id, order_id: order13.id)

order14 = Order.create(total: 40, user_id: user3.id, status: "cancelled")

Donation.create(amount: 20, candidate_issue_id: candidate_issue1.id, user_id: user3.id, order_id: order14.id)

Donation.create(amount: 10, candidate_issue_id: candidate_issue2.id, user_id: user3.id, order_id: order14.id)

Donation.create(amount: 10, candidate_issue_id: candidate_issue3.id, user_id: user3.id, order_id: order14.id)

order15 = Order.create(total: 3000, user_id: user3.id, status: "pending")

Donation.create(amount: 2000, candidate_issue_id: candidate_issue1.id, user_id: user3.id, order_id: order15.id)

Donation.create(amount: 1000, candidate_issue_id: candidate_issue2.id, user_id: user3.id, order_id: order15.id)
puts "Orders and Donations created"
