import express from 'express';
import bodyParser from 'express'

import { executeSQL } from './DBConnection';
import { request } from 'http';

const app = express();
const port = 3000;

app.use(bodyParser.json());

//GET MyUsers
app.get(
    '/myApp',
    async (_, response) =>{
        const list = await executeSQL('SELECT * FROM "MyUsers"');
        response.send(list);
    },
);

//GET MyUsers by id
app.get(
  '/myApp/:id',
  async (request, response) =>{
      const MyUserid = request.params.id;
      const [MyUsers] = await executeSQL(
      `SELECT * FROM "MyUsers" 
      WHERE id = $1;
      `,
      [MyUserid]
      );
      response.send(MyUsers);
  },
);

//POST to MyUsers
app.post(
    '/myApp',
    async (request, response) => {
        const {username, firstname, lastname } = request.body; 
        
        const [MyUsers] = await executeSQL(
            `INSERT INTO "MyUsers"
            (username, firstname, lastname)
            VALUES
            ($1, $2, $3)
            RETURNING *;
            `,
            [username, firstname, lastname],
          );
      
          response.send({ id: MyUsers.id });
    }
);

//PUT to MyUsers
app.put(
    '/myApp/:id',
    async (request, response) => {
      const MyUserid = request.params.id;
      const { username, firstname } = request.body;
      const [updatedUser] = await executeSQL(
        `
          UPDATE "MyUsers"
          SET
            username = $1,
            firstname = $2
          WHERE id = $3
          RETURNING *;
        `,
        [username, firstname, MyUserid],
      );
      response.send(updatedUser);
    },
);

//DELETE from MyUsers
app.delete(
    '/myApp/:id',
    async (request, response) => {
      const MyUserId = request.params.id;
  
      const [deletedUser] = await executeSQL(
        'DELETE FROM "MyUsers" WHERE id = $1 RETURNING *;',
        [MyUserId],
      );
      response.send(deletedUser);
    },
  );


  //GET Posts
app.get(
  '/Posts',
  async (_, response) =>{
      const list = await executeSQL('SELECT * FROM "Posts"');
      response.send(list);
  },
);

//GET Posts by id
app.get(
'/Posts/:id',
async (request, response) =>{
    const Postid = request.params.id;
    const [Post] = await executeSQL(
    `SELECT * FROM "Posts" 
    WHERE id = $1;
    `,
    [Postid]
    );
    response.send(Post);
},
);

//POST to Posts
app.post(
  '/Posts',
  async (request, response) => {
      const {post_description, post_date} = request.body; 
      
      const [Posts] = await executeSQL(
          `INSERT INTO "Posts"
          (post_description, post_date)
          VALUES
          ($1, $2)
          RETURNING *;
          `,
          [post_description, post_date],
        );
    
        response.send({ id: Posts.id });
  }
);

//PUT to Posts
app.put(
  '/Posts/:id',
  async (request, response) => {
    const Postsid = request.params.id;
    const { post_description, post_date} = request.body;
    const [updatedPosts] = await executeSQL(
      `
        UPDATE "Posts"
        SET
          post_description = $1,
          post_date = $2
        WHERE id = $3
        RETURNING *;
      `,
      [post_description, post_date, Postsid],
    );
    response.send(updatedPosts);
  },
);

//DELETE from Posts
app.delete(
  '/Posts/:id',
  async (request, response) => {
    const PostId = request.params.id;

    const [deletedPost] = await executeSQL(
      'DELETE FROM "Posts" WHERE id = $1 RETURNING *;',
      [PostId],
    );
    response.send(deletedPost);
  },
);



  //GET UsersComments
  app.get(
    '/UsersComments',
    async (_, response) =>{
        const list = await executeSQL('SELECT * FROM "UsersComments"');
        response.send(list);
    },
  );
  
  //GET UsersComments by id
  app.get(
  '/UsersComments/:id',
  async (request, response) =>{
      const Commentid = request.params.id;
      const [Comment] = await executeSQL(
      `SELECT * FROM "UsersComments" 
      WHERE id = $1;
      `,
      [Commentid]
      );
      response.send(Comment);
  },
  );
  
  //POST to UsersComments
  app.post(
    '/UsersComments',
    async (request, response) => {
        const {comment_description} = request.body; 
        
        const [UsersComments] = await executeSQL(
            `INSERT INTO "UsersComments"
            (comment_description)
            VALUES
            ($1)
            RETURNING *;
            `,
            [comment_description],
          );
      
          response.send({ id: UsersComments.id });
    }
  );
  
  //PUT to UsersComments
  app.put(
    '/UsersComments/:id',
    async (request, response) => {
      const Commentid = request.params.id;
      const { comment_description} = request.body;
      const [updatedComment] = await executeSQL(
        `
          UPDATE "UsersComments"
          SET
            comment_description = $1
          WHERE id = $2
          RETURNING *;
        `,
        [comment_description, Commentid],
      );
      response.send(updatedComment);
    },
  );
  
  //DELETE from UsersComments
  app.delete(
    '/UsersComments/:id',
    async (request, response) => {
      const CommentId = request.params.id;
  
      const [deletedComment] = await executeSQL(
        'DELETE FROM "UsersComments" WHERE id = $1 RETURNING *;',
        [CommentId],
      );
      response.send(deletedComment);
    },
  );
  




app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
  });


