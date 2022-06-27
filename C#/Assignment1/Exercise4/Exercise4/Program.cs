//// 1. Copying an Array

//int[] arr = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
//int[] copy = new int[arr.Length];

//for (int i = 0; i < arr.Length; i++)
//{
//    copy[i] = arr[i];
//}

//Console.WriteLine("The original array:");
//Console.WriteLine(string.Join(",", arr));

//Console.WriteLine("The copied array:");
//Console.WriteLine(string.Join(",", copy));

//// 2. User-managed list

using System.Collections;

//var list = new ArrayList();
//while(true)
//{
//    Console.WriteLine("Your can manage your list by enter " +
//    "command (+ item, - item, or -- to clear), enter q to quit):");
//    String input = Console.ReadLine();
//    if (input.Equals("q"))
//    {
//        break;
//    }
//    String content = input.Substring(1).Trim();
//    if (input.StartsWith("--"))
//    {
//        list.Clear();
//    }
//    else if (input.StartsWith("+"))
//    {
//        list.Add(content);
//    }
//    else if (input.StartsWith("-")){

//        if (!input.Contains(content))
//        {
//            Console.WriteLine(content + " does not exists, please try again.");
//        }
//        else
//        {
//            list.Remove(content);
//        }
//    }
//    Console.WriteLine("Your current list is: ");
//    foreach (var item in list)
//    {
//        Console.WriteLine(item);
//    }
//}

//// 3. FindPrimesInRange

//static int[] FindPrimesInRange(int startNum, int endNum)
//{
//    ArrayList l = new ArrayList();
//    for (int i = startNum; i <= endNum; i++)
//    {
//        if (isPrime(i))
//        {
//            l.Add(i);
//        }
//    }
//    return (int[])l.ToArray(typeof(int));
//}

//static bool isPrime(int number)
//{
//    int i;
//    for (i = 2; i <= number - 1; i++)
//    {
//        if (number % i == 0)
//        {
//            return false;
//        }
//    }
//    if (i == number)
//    {
//        return true;
//    }
//    return false;
//}
//int low = 1;
//int high = 100;
//Console.WriteLine($"The prime number in range{low} and {high} is:");
//Console.WriteLine(string.Join(",", FindPrimesInRange(low, high)));

//// 4. Sum of rotation array

//static int[] sumOfRotation(int[] arr, int k)
//{
//    int[] res = new int[arr.Length];
//    int tmp = k;
//    for (int i = 0; i < arr.Length; i++)
//    {
//        while (tmp > 0)
//        {
//            int curIndx = i + tmp--;
//            while (curIndx >= arr.Length)
//            {
//                curIndx -= arr.Length;
//            }
//            res[curIndx] += arr[i];
//        }
//        tmp = k;
//    }
//    return res;
//}

//int[] input_four = { 1, 2, 3, 4, 5 };
//int k = 3;
//Console.WriteLine(string.Join(",", sumOfRotation(input_four, k)));

//// 5. longest sequence of equal elements

//static int[] longestSequence(int[] arr)
//{
//    if (arr.Length < 1)
//    {
//        return new int[0];
//    }
//    int max = 1, curMax = 1;
//    int seq = arr[0], pre = arr[0];
//    for (int i = 1; i < arr.Length; i++)
//    {
//        if (arr[i] == pre)
//        {
//            curMax++;
//        }
//        else
//        {
//            if (curMax > max)
//            {
//                max = curMax;
//                seq = pre;
//            }
//            pre = arr[i];
//            curMax = 1;
//        }
//    }
//    int[] res = new int[max];
//    Array.Fill(res, seq);
//    return res;
//}

//int[] input_five = { 2, 1, 1, 2, 2, 2, 3, 3, 3 };
//Console.WriteLine(string.Join(",", longestSequence(input_five)));

//// 6. Most frequent number 

static int mostFrequentNumber(int[] arr)
{
    int cur = 0;
    int max = 0;
    Dictionary<int, int> dic = new Dictionary<int, int>();
    for (int i = 0; i < arr.Length; i++)
    {
        int tmp = dic.GetValueOrDefault(arr[i], 0) + 1;
        if (tmp > max)
        {
            max = tmp;
            cur = arr[i];
        }
        dic[arr[i]] = tmp;
    }
    return cur;
}
int[] input_six = { 7, 7, 7, 0, 2, 2, 2, 0, 10, 10, 10 };
Console.WriteLine(mostFrequentNumber(input_six));