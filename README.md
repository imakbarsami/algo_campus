
<h1>AlgoCampus</h1>

<p>AlgoCampus is a full-featured online course platform. The backend is developed using <strong>Laravel</strong> and provides REST API endpoints, and the frontend is developed in <strong>React</strong>. Users can browse courses, enroll, watch lessons, leave reviews, and track their course progress. Course Creators can create and manage courses, chapters, and lessons.</p>

<h2>Home Page</h2>
<ul>
  <li><strong>Explore Categories:</strong> Shows all course categories.</li>
  <li><strong>Featured Courses:</strong> Displays highlighted courses. Clicking <em>Read More</em> opens the Course Detail page.</li>
  <li><strong>Footer:</strong> Contains popular category links and useful additional links.</li>
</ul>

<h2>Course Page</h2>
<ul>
  <li>Displays all available courses.</li>
  <li>Filtering options include: Category, Level, Language, Keyword, Latest, Oldest.</li>
</ul>

<h2>Course Detail Page</h2>
<ul>
  <li>Displays: Title, Category, Rating, Level, Language, Total Enrolled Students.</li>
  <li>Includes sections for: Overview, What You Will Learn, Requirements.</li>
  <li>Course Structure is shown as: Chapters → Lessons (with videos).</li>
  <li>Preview videos are available (only preview lessons are viewable before enroll).</li>
  <li>Shows totals: Total Chapters, Total Lessons, Total Video Duration.</li>
  <li>Reviews section with star ratings and written feedback.</li>
  <li><strong>Enroll</strong> button to join the course.</li>
</ul>

<h2>User Dashboard (My Account)</h2>
<ul>
  <li><strong>Dashboard:</strong> Shows total sales, total enrollments, total active courses (if instructor).</li>
  <li><strong>Profile:</strong> User can update name and email.</li>
  <li><strong>My Learning:</strong> Lists enrolled courses. Users can leave ratings and feedback.</li>
  <li>Watching lessons shows chapter → lesson list with video playback.</li>
  <li>Each lesson can be marked as complete to track progress.</li>
</ul>

<h2>Course Management</h2>
<ul>
  <li>Create a course with: Title, Category, Level, Language, Cross Price, Price, Outcomes, Requirements, and Cover Image.</li>
  <li>Outcomes and Requirements can be reordered (drag and drop).</li>
  <li>Create/Edit/Delete chapters.</li>
  <li>Create/Edit/Delete lessons inside chapters.</li>
  <li>Chapters and lessons can be reordered (drag and drop sort).</li>
  <li>Lessons include video upload.</li>
</ul>

<h2>Password Management</h2>
<p>Users can change passwords from the account settings.</p>

<h2>Future Enhancements</h2>
<ul>
  <li>Admin panel</li>
  <li>Payment system integration</li>
  <li>Course completion certificate generation</li>
</ul>

<h2>Tech Stack</h2>
<ul>
  <li><strong>Backend:</strong> Laravel API</li>
  <li><strong>Frontend:</strong> React</li>
  <li><strong>API Testing:</strong> Thunder Client</li>
  <li><strong>Image Processing:</strong> Intervention Image</li>
</ul>

<h2>Clone Repository</h2>
<pre>
git clone https://github.com/imakbarsami/algo_campus
cd algo_campus
</pre>

<h2>Backend Setup</h2>
<pre>
cd backend
composer install
cp .env.example .env
php artisan key:generate
# Set database credentials in .env
php artisan serve
</pre>

<h2>Frontend Setup</h2>
<pre>
cd frontend
npm install
Set API base URL in .env
npm run dev
</pre>

<h2>API Endpoints (Lesson Management)</h2>
<pre>
POST   /lessons                     → store (create lesson)
GET    /lesson/edit/{id}            → edit (get lesson data for editing)
PUT    /lessons/{id}                → update lesson
DELETE /lessons/{id}                → delete lesson
POST   /save-lesson-video/{id}      → upload or replace lesson video
POST   /sort-lessons                → drag & drop sorting of lessons
</pre>

<h2>Output</h2>

<img width="1877" height="2254" alt="home" src="https://github.com/user-attachments/assets/b94fd230-61d0-4daa-982d-5f96644d1f9e" />

<h4 align="center">Home</h4>

<img width="1877" height="1468" alt="courses" src="https://github.com/user-attachments/assets/f36bd9e9-d98d-44f5-a5f4-13b0650e222c" />

<h4 align="center">Courses</h4>

<img width="1877" height="2759" alt="course-readmore" src="https://github.com/user-attachments/assets/22a8902c-45e6-4c53-9d6c-9dee553f3ad6" />

<h4 align="center">Course Info</h4>

<img width="1877" height="997" alt="dashboard" src="https://github.com/user-attachments/assets/7cfc419e-0206-4655-987c-bdf1efc04d8a" />

<h4 align="center">Dashbaord</h4>

<img width="1877" height="997" alt="profile" src="https://github.com/user-attachments/assets/82ebd9ae-bc34-4a93-b432-f6529bd98df4" />

<h4 align="center">Profile</h4>

<img width="1877" height="969" alt="learning" src="https://github.com/user-attachments/assets/18c8de46-07a0-40da-8c3f-b2826b792503" />

<h4 align="center">My Learning</h4>

<img width="1877" height="997" alt="feedback" src="https://github.com/user-attachments/assets/6d3d7f81-1e9a-4a57-9542-db0eac9d9d94" />

<h4 align="center">Rating & Feedback</h4>

<img width="1877" height="2399" alt="watch-course" src="https://github.com/user-attachments/assets/19665da9-ce54-4a42-a71a-467ee198d592" />

<h4 align="center">Watch Course</h4>


<img width="1877" height="1849" alt="mycourses" src="https://github.com/user-attachments/assets/0c5f7ac3-f481-4df7-a7e9-a3f166da6791" />

<h4 align="center">My Course</h4>

<img width="1877" height="2422" alt="course-detail" src="https://github.com/user-attachments/assets/b6ee0c49-f5a9-444a-a66c-92bad4a3a7c4" />

<h4 align="center">Course Detail</h4>
<img width="1877" height="1851" alt="lesson-detail" src="https://github.com/user-attachments/assets/caab9a45-77af-40b9-8db0-45e0ad4fb0ef" />


<h4 align="center">Lesson Detail</h4>

<img width="1877" height="1103" alt="change-password" src="https://github.com/user-attachments/assets/8c4ae029-3f09-4550-9bf1-893b358d43b1" />

<h4 align="center">Change Password</h4>


<h2>Contributing</h2>
<p>Contributions, issues, and suggestions are welcome. If you'd like to contribute, please fork the repository, create a feature branch, and submit a pull request describing your changes.</p>

<h2>Contact</h2>
<p>For questions or collaboration, contact: <a href="mailto:mdsamipuc@gmail.com">mdsamipuc@gmail.com</a></p>

</body>
</html>
