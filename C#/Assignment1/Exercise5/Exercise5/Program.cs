using System.Text;
using System.Collections;
// 1. String reverse
Console.WriteLine("Input your string");

string input = Console.ReadLine();

char[] charArr = input.ToCharArray();
Array.Reverse(charArr);
String reverse = new string(charArr);

Console.WriteLine(reverse);

for (int i = input.Length - 1; i >= 0; i--)
{
    Console.Write(input[i]);
}

// 2. Reverse sentence without changing the punctuation and spaces



char[] pun = new char[] { '/', ':', ';', '.', ',', '=', '(', ')', '&',
    '[', ']', '\\', '/', '!', '?'};

static string getPrefix(string s, char[] pun)
{
    var sb = new StringBuilder();
    for (int i = 0; i < s.Length; i++)
    {
        if (pun.Contains(s[i]))
        {
            sb.Append(s[i]);
        }
        else
        {
            break;
        }
    }
    return sb.ToString();
}

static string getPostfix(string s, char[] pun)
{
    var sb = new StringBuilder();
    for (int i = s.Length - 1; i >= 0; i--)
    {
        if (pun.Contains(s[i]))
        {
            sb.Insert(0, s[i]);
        }
        else
        {
            break;
        }
    }
    return sb.ToString();
}

string test = "The quick brown fox jumps over the lazy dog /Yes! Really!!!/.";
string[] split = test.Split(" ");

string[] res = new string[split.Length];

int left = 0, right = split.Length - 1;
while (left < right)
{
    string lWord = split[left];
    string rWord = split[right];

    string lPre = getPrefix(lWord, pun);
    string rPre = getPrefix(rWord, pun);

    string lPost = getPostfix(lWord, pun);
    string rPost = getPostfix(rWord, pun);

    string lBody, rBody;

    if (lWord.Split(pun)[0].Equals(""))
    {
        lBody = lWord.Split(pun)[1];
    }
    else
    {
        lBody = lWord.Split(pun)[0];
    }

    if (rWord.Split(pun)[0].Equals(""))
    {
        rBody = rWord.Split(pun)[1];
    }
    else
    {
        rBody = rWord.Split(pun)[0];
    }

    res[left++] = lPre + rBody + lPost;
    res[right--] = rPre + lBody + rPost;
}

if (left == right)
{
    res[left] = split[left];
}

Console.WriteLine(string.Join(" ", res));


// 3. Extract all unique plindromes substring in a sentence


static string getAllPlindromes(string s)
{
    ArrayList list = new ArrayList();
    for (int i = 1; i < s.Length - 1; i++)
    {
        int len = plindromeLength(s, i - 1, i + 1);
        if (len != -1)
        {
            int start = i - (len / 2);
            string sub = s.Substring(start, len + 1);
            if (!list.Contains(sub))
            {
                list.Add(sub);
            }
        }
        len = plindromeLength(s, i - 1, i);
        if (len != -1)
        {
            int start = i - ((len + 1) / 2);
            string sub = s.Substring(start, len + 1);
            if (!list.Contains(sub))
            {
                list.Add(sub);
            }

        }
    }
    return string.Join(", ", (string[])list.ToArray(Type.GetType("System.String")));
}

static int plindromeLength(string s, int l, int r)
{
    if (!s[l].Equals(s[r]))
    {
        return -1;
    }
    while (s[l].Equals(s[r]) & l >= 0 & r < s.Length)
    {
        l--;
        r++;
    }
    return r - l - 2;
}

string input_t = "Hi,exe? ABBA! Hog fully a string: ExE. Bob";
Console.WriteLine(getAllPlindromes(input_t));

// 4. Parse an URL

static void parseURL(string input)
{
    string[] sp = input.Split("://");
    Console.WriteLine("[protocol] = " + "\"" + sp[0] + "\"");

    sp = sp[1].Split("/", 2);

    Console.WriteLine("[server] = " + "\"" + sp[0] + "\"");
    Console.WriteLine("[resource] = " + "\"" + sp[1] + "\"");
}

string input_url = "https://www.apple.com/iphone";
parseURL(input_url);