Candidate.create(name: "Donald Trump", party: "Republican", bio: "Was born in the most luxurious crib the world has ever seen, in the most luxurious presidential suite in the universe. Puts his name on everything he owns, now wants to put his name on the White House.", featured: true, last_name: "trump")

Candidate.create(name: "Jeb Bush", party: "Republican", bio: "Born under a bush. Father sent him to live with the bush people until he was old enough to take over the family business selling shrubberies. Eventually became Governor of Florida. As president, wants to make sure that every American can afford to put a bush on their front lawn.", last_name: "bush")

Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Mr. Cruz was born to immigrant parents, whom he promptly reported to INS. Cruz grew up idolizing Dobby The House Elf from Harry Potter, and underwent many plastic surgeries to shape himself in Dobby's image. As President of the United States, Cruz wants to every American to be a 'Very proud wacko bird' just like him.", last_name: "cruz")

Candidate.create(name: "Hillary Clinton", party: "Democratic", bio: "Ms. Clinton was brought into spontaneous existence due to complex interactions between scripts on her parents' personal email server. As the pioneering robotic overlady of the human race, she (it?) strives to bridge a peaceful connection between human and robotic civilizations.", featured: true, last_name: "clinton")

Candidate.create(name: "Bernie Sanders", party: "Democratic", bio: "Mr. Sanders is decended from a long line of Keebler elfs, but chose break off from family tradition to make sure that even America's poorest residents have a pantry full of Keebler Fudge Stripes. Legend has it that the more dishelved his appearance, the greater his power.", featured: true, last_name: "sanders")

Candidate.create(name: "Joe Biden", party: "Democratic", bio: "While not officially running, Joe Biden's ambitions to show America 'where the party's at' are clear. Born to humble bartenders, Biden quickly endeared himself to the local patrons of 'Shotgun Joe's,' his namesake. His social acumen prompted a drunken patron one day to suggest that he run for public office. Biden, with Cheshire Cat smile, shook off his 11am buzz, and stumbled into the office of the Vice President. He looks to repeat this success in the 2016 election.", last_name: "biden")

Issue.create(topic: "Marriage Equality", description: "The central argument in the upcoming debates will be quite simple. Kim Davis vs. humans marrying sheep. Discuss.")

Issue.create(topic: "Environment", description: "Set to be a hotly contested issue, candidates will debate whether climate change is a hoax or if the world is set to end in 20 years time.", featured: true)

Issue.create(topic: "Immigration", description: "Some candidates insist that their families materialized from America's soil, never to have experienced immigration, while others would like to open Lady Liberty's arms to the masses.", featured: true)

Issue.create(topic: "ISIS", description: "We can already hear the arguments unfolding and the debates haven't started. Republican: 'In conjunction with sharing our deep held values of A-MUR-I-CA, cheeseburgers included, we are making great progress against ISIS with every drone strike. They're the best!' Democrats: 'No no no, drone attacks are the work of the devil! We should sit down to a nice lunch with their leader and discuss these issues like adults.'")

Issue.create(topic: "Gun Control", description: "'Let them have guns!,' some politicians might yell, channelling their inner Marie Antoinettes, while others will argue that prison rules should apply - anything that can be used as a weapon, should be illegal. Please ask yourself, would you like to own an AK47 or would you like to eat with your hands?")

Issue.create(topic: "Economy", description: "The hard working, and deserving, 1 percenters are the way of the future according to some. Others envision a single world commune where everyone's opinion is equally important.", featured: true)

CandidateIssue.create(stance: "Only the most luxuriously dressed grooms/brides will be allowed to wed each other.", candidate_id: 1, issue_id: 1)

CandidateIssue.create(stance: "All trees should be gilded.", candidate_id: 1, issue_id: 2)

CandidateIssue.create(stance: "We're gonna make a giant sea wall to keep out all the illegal Chinese, and we're gonna make Mexico pay for it!", candidate_id: 1, issue_id: 3)

CandidateIssue.create(stance: "Kill 'em all!", candidate_id: 1, issue_id: 4)

CandidateIssue.create(stance: "Gold guns for everyone, with diamond bullets.", candidate_id: 1, issue_id: 5)

CandidateIssue.create(stance: "I'll run America like one my many, many, many, many successful bankrupt businesses.", candidate_id: 1, issue_id: 6)

CandidateIssue.create(stance: "Only homosexual and bicurious shrubberies will be permitteed the right to marry the plant they love.", candidate_id: 2, issue_id: 1)

CandidateIssue.create(stance: "Global warming puts all of us in danger, but most importantly the indigenous bush people. Haliburton will be given a no-bid multi-billion dollar contract to protect the bush people's dwinding habitat and general livelihood.", candidate_id: 2, issue_id: 2)

CandidateIssue.create(stance: "Latin American bushes will be allowed to seek asylum at nurseries around the nation.", candidate_id: 2, issue_id: 3)

CandidateIssue.create(stance: "We will earn favor with ISIS by welcoming them to the neighborhood with well manicured bushes. Either that or nuke them?", candidate_id: 2, issue_id: 4)

CandidateIssue.create(stance: "All guns will be banned from use for US Citizens inside and outside our nation. The gratuitous and horrific murder of Cecil the bush has raied awareness to our serious gun problem and made action on this issue a cornerstone of my platform.", candidate_id: 2, issue_id: 5)

CandidateIssue.create(stance: "I will measure the strength of our economy by whether all Americans have the opportunity to provide thier family with numerous bushes and shrubberies from the nursery of thie choice.", candidate_id: 2, issue_id: 6)

CandidateIssue.create(stance: "Only straight men and women deserve the 50% chance of becoming devorced after marriage, just like God intended.", candidate_id: 3, issue_id: 1)

CandidateIssue.create(stance: "We will bend Mother Nature to our will. I'm thinking of something analagous to the evil corporation from James Cameron's 'Avatar.'", candidate_id: 3, issue_id: 2)

CandidateIssue.create(stance: "Now that I made it here in America, no one else is allowed in. That's fair right?", candidate_id: 3, issue_id: 3)

CandidateIssue.create(stance: "Our young, brave American soldiers are ready and willing to take on ISIS, an existential threat to our nation. Just not my kids. Or my friends' kids.", candidate_id: 3, issue_id: 4)

CandidateIssue.create(stance: "Why does rambo get to have all the fun?", candidate_id: 3, issue_id: 5)

CandidateIssue.create(stance: "Our economy does best when government gets out of the way. That's why we need to cut all funding for building public roads and public schools to bring America back to greatness.", candidate_id: 3, issue_id: 6)


CandidateIssue.create(stance: "All Americans deserve to have a husband that embarasses them on national television multiple times.", candidate_id: 4, issue_id: 1)

CandidateIssue.create(stance: "The precedent of imminent domain will be used to relocate the residents of Alaska elsewhere to make way for the worlds largest polar bear sanctuary.", candidate_id: 4, issue_id: 2)

CandidateIssue.create(stance: "All undocumented immigrants should be given voting rights so the demographics shift in my favor and ensure a second term as president.", candidate_id: 4, issue_id: 3)

CandidateIssue.create(stance: "I plan to continue my predecssor's campagin of mostly indescriminate drone attacks.", candidate_id: 4, issue_id: 4)

CandidateIssue.create(stance: "I plan to implement a Chris Rock-inspired policy on firearms: guns are free but bullets cost $10,000 each.", candidate_id: 4, issue_id: 5)

CandidateIssue.create(stance: "To ensure a strong economy we need to invest in our public schools. All Americans should feel good about sending their kids to our nation's public institution. Except Chelsea. I'll be damned if my grandchildren go to school with the proletariat.", candidate_id: 4, issue_id: 6)

CandidateIssue.create(stance: "The human race is a plague on our planet, extermination is the only reasonable course of action.", candidate_id: 5, issue_id: 2)

CandidateIssue.create(stance: "Let's invite them all to a round table discussion.", candidate_id: 5, issue_id: 4)
