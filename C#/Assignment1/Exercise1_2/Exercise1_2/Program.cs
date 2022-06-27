// See https://aka.ms/new-console-template for more information

/* Play with readline, writeline */

Console.WriteLine("What is your favoirte color?");

String input = Console.ReadLine();

Console.WriteLine($"Your favorite color is {input}");

/* UnderstandingTypes */

String type = "byte";
byte b = byte.MaxValue;
byte byteNum = 1;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {b}");

type = "sbyte";
sbyte sb = sbyte.MaxValue;
byteNum = 1;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {sb}");


type = "short";
short s = short.MaxValue;
byteNum = 2;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {s}");

type = "ushort";
ushort st = ushort.MaxValue;
byteNum = 2;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {st}");

type = "int";
int i = int.MaxValue;
byteNum = 4;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {i}");

type = "uint";
uint ui = uint.MaxValue;
byteNum = 4;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {ui}");

type = "long";
long l = long.MaxValue;
byteNum = 8;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {l}");

type = "ulong";
ulong ul = ulong.MaxValue;
byteNum = 8;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {ul}");

type = "float";
float f = float.MaxValue;
byteNum = 4;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {f}");

type = "double";
double d = double.MaxValue;
byteNum = 8;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {d}");

type = "decimal";
decimal de = decimal.MaxValue;
byteNum = 16;

Console.WriteLine($"The {type} takes {byteNum} byte and the maximum value is {de}");

/* Convert centuries */

try
{
    int input = Int32.Parse(Console.ReadLine());

    long years = input * 100;

    long days = years * 365;

    long hours = days * 24;

    long minutes = hours * 60;

    long seconds = minutes * 60;

    ulong milliseconds = (ulong)seconds * 1000;

    ulong nanoseconds = milliseconds * 1000;

    Console.WriteLine($"{input} centuries = {years} years = {days} days = " +
        $"{hours} hours = {minutes} minutes = {seconds} seconds =" +
        $"{milliseconds} milliseconds = {nanoseconds} nanoseconds");
}
catch (Exception e)
{
    Console.WriteLine("The input is not a integer or its value is too large, please try again.");
}


