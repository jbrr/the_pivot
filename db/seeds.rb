Candidate.create(name: "Donald Trump", party: "Republican", bio: "Was born in the most luxurious crib the world has ever seen, in the most luxurious presidential suite in the universe. Puts his name on everything he owns, now wants to put his name on the White House.")

Candidate.create(name: "Jeb Bush", party: "Republican", bio: "Born under a bush. Father sent him to live with the bush people until he was old enough to take over the family business selling shrubberies. Eventually became Governor of Florida. As president, wants to make sure that every American can afford to put a bush on their front lawn.")

Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Mr. Cruz was born to immigrant parents, whom he promptly reported to INS. Cruz grew up idolizing Dobby The House Elf from Harry Potter, and underwent many plastic surgeries to shape himself in Dobby's image. As President of the United States, Cruz wants to every American to be a 'Very proud wacko bird' just like him.")

Candidate.create(name: "Hillary Clinton", party: "Democratic", bio: "Ms. Clinton was brought into spontaneous existence due to complex interactions between scripts on her parents' personal email server. As the pioneering robotic overlady of the human race, she (it?) strives to bridge a peaceful connection between human and robotic civilizations.")

Candidate.create(name: "Bernie Sanders", party: "Democratic", bio: "Mr. Sanders is decended from a long line of Keebler elfs, but chose break off from family tradition to make sure that even America's poorest residents have a pantry full of Keebler Fudge Stripes. Legend has it that the more dishelved his appearance, the greater his power.")

Candidate.create(name: "Joe Biden", party: "Democratic", bio: "While not officially running, Joe Biden's ambitions to show America 'where the party's at' are clear. Born to humble bartenders, Biden quickly endeared himself to the local patrons of 'Shotgun Joe's,' his namesake. His social acumen prompted a drunken patron one day to suggest that he run for public office. Biden, with Cheshire Cat smile, shook off his 11am buzz, and stumbled into the office of the Vice President. He looks to repeat this success in the 2016 election.")

Issue.create(topic: "Marriage Equality", description: "The central argument in the upcoming debates will be quite simple. Kim Davis vs. humans marrying sheep. Discuss.")

Issue.create(topic: "Environment", description: "Set to be a hotly contested issue, candidates will debate whether climate change is a hoax or if the world is set to end in 20 years time.")

Issue.create(topic: "Immigration", description: "Some candidates insist that their families materialized from America's soil, never to have experienced immigration, while others would like to open Lady Liberty's arms to the masses.")

Issue.create(topic: "ISIS", description: "We can already hear the arguments unfolding and the debates haven't started. Republican: 'In conjunction with sharing our deep held values of A-MUR-I-CA, cheeseburgers included, we are making great progress against ISIS with every drone strike. They're the best!' Democrats: 'No no no, drone attacks are the work of the devil! We should sit down to a nice lunch with their leader and discuss these issues like adults.'")

Issue.create(topic: "Gun Control", description: "'Let them have guns!,' some politicians might yell, channelling their inner Marie Antoinettes, while others will argue that prison rules should apply - anything that can be used as a weapon, should be illegal. Please ask yourself, would you like to own an AK47 or would you like to eat with your hands?")

Issue.create(topic: "Economy", description: "The hard working, and deserving, 1 percenters are the way of the future according to some. Others envision a single world commune where everyone's opinion is equally important.")

CandidateIssue.create(stance: "All trees should be gilded.", candidate_id: 1, issue_id: 2)

CandidateIssue.create(stance: "Kill 'em all!", candidate_id: 1, issue_id: 4)

CandidateIssue.create(stance: "The human race is a plague on our planet, extermination is the only reasonable course of action.", candidate_id: 5, issue_id: 2)

CandidateIssue.create(stance: "Let's invite them all to a round table discussion.", candidate_id: 5, issue_id: 4)
