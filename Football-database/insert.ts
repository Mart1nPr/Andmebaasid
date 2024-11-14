import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  const team1 = await prisma.club.create({
    data: {
      name: 'FC Barcelona',
      city: 'Barcelona, Hispaania',
      player: {
        create: [
          { name: 'Lionel Messi', birthdate: '2021-07-30T00:00:00Z' },
          { name: 'Xavi Hernández', birthdate: '2021-07-30T00:00:00Z'}
        ]
      }
    }
  });

  const team2 = await prisma.club.create({
    data: {
      name: 'Manchester United',
      city: 'Manchester, Inglismaa',
      player: {
        create: [
          { name: 'Cristiano Ronaldo', birthdate: '2021-07-30T00:00:00Z'},
          { name: 'Paul Pogba', birthdate: '2021-07-30T00:00:00Z'}
        ]
      }
    }
  });

  console.log('Loodud meeskonnad:', team1, team2);
}

main()
  .catch(e => {
    console.error('Viga:', e.message);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
