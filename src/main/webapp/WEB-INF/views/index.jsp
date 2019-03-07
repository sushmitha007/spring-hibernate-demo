<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Muzix-app</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.jumbotron {
	margin-bottom: 10px;
}

.panel-heading {
	word-wrap: break-word;
}

.panel-body {
	word-wrap: break-word;
}

.column-sm { : 20px
	package com.stackroute.muzixapp.model;

import javax.persistence.*;

@Entity
public class Track {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String name;
	@Column
	private String comment;

	public Track() {
	}

	public Track(int id, String name, String comment) {
		this.id = id;
		this.name = name;
		this.comment = comment;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Track{" +
				"id=" + id +
				", name='" + name + '\'' +
				", comment='" + comment + '\'' +
				'}';
	}
}
}

.card {
	background-color: whitesmoke;
	word-wrap: break-word;
	padding: 10px;
	font-family: monospace;
	margin-top: 5px;
}

.card-title {
	text-align: center;
}

.delete-link {
	color: red;
	margin-left: 220px;
}

.card:hover {
	z-index: 1000;
	box-shadow: rgba(0, 0, 0, 0.3) 0px 16px 16px 16px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.3) 0px 16px 16px 16px;
	-moz-box-shadow: rgba(0, 0, 0, 0.3) 0px 16px 16px 16px;
}
</style>
</head>

<body>
	<div class="jumbotron">
		<div class="container text-center">
			<form action="add" method="post">


				<div class="form-group row">
					<label for="colFormLabelLg"
						class="col-sm-3 col-form-label col-form-label-lg"></label>
					<div class="col-sm-4">
						<textarea class="form-control" id="name" name="name"
							placeholder="Enter your tracks here" rows="3"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label for="colFormLabelLg"
						class="col-sm-3 col-form-label col-form-label-lg"></label>
					<div class="col-sm-4">
						<textarea class="form-control" id="comment" name="comment"
							placeholder="Enter your comment here" rows="3"></textarea>
					</div>
				</div>
				<div class="col-sm-10">
					<button type="submit" class="btn btn-primary btn-sm">Add</button>
				</div>
			</form>
		</div>
	</div>
	<c:if test="${!empty tracks}">
		<div class="container">
			<div class="row">
				<c:forEach items="${tracks}" var="track">
					<div class="col-sm-4">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">
									<B>${track.name}</B>
								</h4>
								<p class="card-text">${track.comment}</p>
								
								<%-- <a href="delete?id=${track.id}" target="_parent"
									class="delete-link">Delete</a> <a
									href="edit?id=${track.id}" class="modify-link">Modify</a> --%>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</c:if>
	<br>
	<br>
	<br>
</body>

</html>