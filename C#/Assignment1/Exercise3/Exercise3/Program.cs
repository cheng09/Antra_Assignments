/* Controlling Flow and Converting Types */

// 1. FizzBuzzis

for (int i = 1; i <= 100; i++)
{
    Console.Write(i);

    if (i % 3 == 0)
    {
        Console.Write('\t' + "fizz");
    }

    if (i % 5 == 0)
    {
        Console.Write('\t' + "buzz");
    }

    if (i % 15 == 0)
    {
        Console.Write('\t' + "fizzbuzz");
    }

    Console.WriteLine();
}

// 2. Print-a-Pyramid

Console.WriteLine("Please enter the level number of pyramid you want to build.");
int level = int.Parse(Console.ReadLine());

int curlevel = 1;

for (int i = level; i > 0; i--)
{
    for (int j = 0; j < i - 1; j++)
    {
        Console.Write(" ");
    }
    for (int k = 0; k < curlevel; k++)
    {
        Console.Write("*");
    }
    curlevel += 2;
    Console.WriteLine();
}

// 3. Guess number

int correctNumber = new Random().Next(3) + 1;

Console.WriteLine("Take a guess among 1, 2, 3");

try
{
    int guessedNumber = int.Parse(Console.ReadLine());
    while (correctNumber != guessedNumber)
    {
        String type;
        if (guessedNumber > correctNumber)
        {
            type = "higher";
        }
        else
        {
            type = "lower";
        }
        Console.WriteLine($"Your guess is {type}, please guess again");
        guessedNumber = int.Parse(Console.ReadLine());
    }

    Console.WriteLine("Your guess is correct!");
}
catch (Exception e)
{
    Console.WriteLine("Your input is not correct. Please restart again.");
}

// 4. birth date calculation

Console.WriteLine("Please give your birthday in format: mm/dd/yyyy");
String input = Console.ReadLine();

DateTime birthDate = Convert.ToDateTime(input);
DateTime TodayDate = DateTime.Today;
var days = (TodayDate - birthDate).TotalDays;
Console.WriteLine($"You are {days} days old!");

int daysToNextAnniversary = 10000 - ((int)days % 10000);
Console.WriteLine($"Your next 10000 anniversary is in {daysToNextAnniversary} days!");

//5.
int hour = DateTime.Now.Hour;
String type;
if (hour < 12)
{
    type = "Morning";
}
else if (hour < 18)
{
    type = "Afternoon";
}
else if (hour < 21)
{
    type = "Evening";
}
else
{
    type = "Night";
}

Console.WriteLine("Good " + type);

// 6. Count up to 24 using four different increments

for (int i = 1; i < 5; i++)
{
    for (int j = 0; j <= 24; j += i)
    {
        if (j != 0)
        {
            Console.Write(",");
        }
        Console.Write(j);
    }
    Console.WriteLine();
}