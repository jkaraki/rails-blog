# README

<h1>Rails Blog</h1>
  <p>
    This Rails Blog has four tables:
  </p>
    <ul>
      <li>Users</li>
      <li>Posts</li>
      <li>Comments</li>
      <li>Taggings</li>
    </ul>

  <p>
    The relationships between them are:
  </p>
    <ul>
      <li>One to Many between Users and Posts</li>
      <li>One to many between Users and Comments</li>
      <li>One to many between Posts and Comments</li>
      <li>Many to many between Posts and Taggings (with a join table containing the post_id and tag_id)</li>
    </ul>

  <p>
    This blog incorporates the following gems:
  </p>
    <ul>
      <li>paperclip - to attach photos</li>
      <li>sqlite3 and activerecord - database management and ORM</li>
      <li>pry-rails and pry - to make it easier on the eyes in the console</li>
      <li>sorcery - password encryption using bcrypt</li>
    </ul>
