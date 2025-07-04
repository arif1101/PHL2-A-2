## Q-1. PostgreSQL কী?

PostgreSQL একটি ফ্রি, ওপেন-সোর্স ডেটাবেস সিস্টেম যা রিলেশনাল (SQL) এবং নন-রিলেশনাল (JSON) উভয় ধরনের কুয়েরি সাপোর্ট করে।  
এটি ডায়নামিক ওয়েবসাইট ও ওয়েব অ্যাপ্লিকেশন, ফাইন্যান্সিয়াল সিস্টেম, গবেষণা ডেটাবেস, এবং মোবাইল ও IoT অ্যাপে ব্যাপকভাবে ব্যবহৃত হয়।

**PostgreSQL অনেক প্রোগ্রামিং ভাষা সাপোর্ট করে:** Python, Java, C/C++, C#, Node.js, Go, Ruby, Perl, এবং Tcl।

PostgreSQL তৈরি হয়েছে ক্যালিফোর্নিয়া বিশ্ববিদ্যালয়, বার্কলির কম্পিউটার সায়েন্স ডিপার্টমেন্টে।

### মূল বৈশিষ্ট্যসমূহ

- **ওপেন-সোর্স:** ফ্রি, পরিবর্তন করা যায়。
- **রিলেশনাল:** টেবিল, রো ও কলামের মাধ্যমে ডেটা সংরক্ষণ。
- **SQL ও অ্যাডভান্সড কুয়েরি:** স্ট্যান্ডার্ড SQL ও উন্নত কুয়েরি সাপোর্ট。
- **ACID কমপ্লায়েন্ট:** ডেটার নিরাপত্তা ও ইন্টেগ্রিটি নিশ্চিত করে。
- **এক্সটেনসিবল:** নিজের ডেটা টাইপ, ফাংশন ইত্যাদি তৈরি করা যায়。
- **JSON ও XML সাপোর্ট:** স্ট্রাকচার্ড ও সেমি-স্ট্রাকচার্ড ডেটা হ্যান্ডেল করতে পারে。
- **ক্রস-প্ল্যাটফর্ম:** Linux, Windows, macOS ইত্যাদিতে চলে।

## Q-2. PostgreSQL-এ ডেটাবেস স্কিমার উদ্দেশ্য কী?

একটি স্কিমা হলো PostgreSQL ডেটাবেসের ভিতরের একটি ফোল্ডারের মতো।

যেমন কম্পিউটারে বিভিন্ন ফাইল আলাদা ফোল্ডারে রাখে, PostgreSQL-এ টেবিল, ভিউ, ও অন্যান্য অবজেক্ট স্কিমার মাধ্যমে সংগঠিত হয়।

### স্কিমা কেন দরকার?

- **সংগঠিত রাখা:** ডেটাবেস পরিষ্কার ও গোছানো থাকে。
- **নাম কনফ্লিক্ট এড়ানো:** আলাদা স্কিমায় একই টেবিলের নাম ব্যবহার করা যায়。
- **পারমিশন সেট করা:** কে কী দেখতে বা পরিবর্তন করতে পারবে তা নিয়ন্ত্রণ করা যায়。
- **নিরাপদে কাজ:** আলাদা টিম বা ইউজার আলাদা স্কিমায় কাজ করতে পারে, একে অপরের কাজে বাধা না দিয়ে।

## Q-3. PK (Primary Key) ও FK (Foreign Key) ব্যাখ্যা করুন

**Primary Key (PK):**  
প্রাইমারি কি হলো টেবিলের প্রতিটি রো-এর জন্য ইউনিক আইডি。
- প্রতিটি রো আলাদা (ইউনিক) হতে হবে。
- এটি কখনো ফাঁকা (NOT NULL) হতে পারবে না।

**উদাহরণ:**
```sql
CREATE TABLE persons (
  person_id SERIAL PRIMARY KEY,
  name TEXT
);
```
এখানে `person_id` হলো প্রাইমারি কি। এটি প্রতিটি ব্যক্তিকে ১, ২, ৩ ইত্যাদি ইউনিক নম্বর দেয়।

---

**Foreign Key (FK):**  
foreign key দুইটি টেবিলকে সংযুক্ত করতে ব্যবহৃত হয়。
- এটি এক টেবিলের একটি কলাম, যা অন্য টেবিলের প্রাইমারি কি-কে রেফার করে।

**উদাহরণ:**
```sql
CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  name TEXT,
  person_id INT REFERENCES persons(person_id) NOT NULL
);
```
এখানে `employees` টেবিলের `person_id` হলো foreign key। এটি প্রতিটি কর্মচারীকে `persons` টেবিলের একজন ব্যক্তির সাথে যুক্ত করে।

## Q-4. VARCHAR এবং CHAR ডেটা টাইপের মধ্যে পার্থক্য কী?

`VARCHAR` ও `CHAR` দুটোই টেক্সট (স্ট্রিং) সংরক্ষণে ব্যবহৃত হয়, তবে এদের স্টোরেজ ও স্পেস ব্যবস্থাপনা আলাদা।

**CHAR(n):**
- নির্দিষ্ট আকারের টেক্সট。
- যেমন `CHAR(5)` দিলে, সবসময় ৫টি ক্যারেক্টার ব্যবহার করবে。
- কম ক্যারেক্টার দিলে, বাকি অংশ স্পেস দিয়ে পূরণ করবে।

**উদাহরণ:**
```sql
CREATE TABLE students (
  name CHAR(5)
);
-- 'Arif' দিলে হবে: 'Arif ' (১টি স্পেসসহ)
```

**VARCHAR(n):**
- পরিবর্তনশীল আকারের টেক্সট。
- যেমন `VARCHAR(5)` দিলে, ১ থেকে ৫টি ক্যারেক্টার হতে পারে। বাড়তি স্পেস যোগ হয় না。
  
**উদাহরণ:**
```sql
CREATE TABLE students (
  name VARCHAR(5)
);
-- 'Arif' দিলে থাকবে: 'Arif' (কোনো বাড়তি স্পেস নয়)
```

## Q-5. SELECT স্টেটমেন্টে WHERE ক্লজের উদ্দেশ্য কী?

`WHERE` ক্লজ SQL কুয়েরিতে ডেটা ফিল্টার করতে ব্যবহৃত হয়।

- `SELECT` টেবিলের সব ডেটা রিটার্ন করে。
- `WHERE` নির্দিষ্ট শর্ত দিয়ে শুধু চাওয়া রো-গুলো রিটার্ন করে।

**উদাহরণ:**
```sql
SELECT * FROM students
WHERE age > 21;
```
এই কুয়েরি শুধু তাদেরই দেখাবে, যাদের বয়স ২১-এর বেশি।