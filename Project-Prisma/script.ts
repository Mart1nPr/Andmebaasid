import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient()

async function main() {
    const Team1 = await prisma.Team1.create({data: {nimi: "Hello", vanus: 45, meeskond: "Skibidi"}})
    const Team2 = await prisma.Team2.create({data: {nimi: "world", vanus: 40, messkond: "Skibidi2"}})

    console.log(Team1) 
    console.log(Team2)
}

main()
    .catch(e => {console.error(e.message)})
    .finally(async () => {await prisma.$disconnect()})