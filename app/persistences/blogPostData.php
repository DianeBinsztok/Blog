<?php
function lastBlogPosts($data){
   $homeData= $data->query(file_get_contents("database/lastBlogPosts.sql"));
   return $homeData->fetchAll();
}
