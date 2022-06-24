package com.dangtruong.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dangtruong.model.Comment;

public interface CommentDAO extends JpaRepository<Comment, Integer>{

}
