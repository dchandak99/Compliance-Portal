﻿<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Occupancy._Default" %>



    <!doctype html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="icon" href="favicon.ico" type="image/x-icon"/>

<title>:: Epic :: Login</title>

<!-- Bootstrap Core and vandor -->
<link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.min.css" />

<!-- Core css -->
<link rel="stylesheet" href="../assets/css/style.min.css"/>

</head>
<body class="font-muli theme-cyan gradient">

<div class="auth option2">
    <div class="auth_left">
        <div class="card">
            <div class="card-body">
                <div class="text-center">
                    <a class="header-brand" href="index.html"><i class="fa fa-braille brand-logo"></i></a>
                    <div class="card-title mt-3">Login to your MyzOne account</div>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label class="form-label"><a href="forgot-password.html" class="float-right small">Forgot MyzOne Password? </a></label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="form-group">
                    <label class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" />
                    <span class="custom-control-label">Remember me</span>
                    </label>
                </div>
                <div class="text-center">
                    <a href="dashboard.aspx" class="btn btn-primary btn-block" title="">Sign in</a>
                </div>
            </div>
        </div>        
    </div>
</div>

<!-- Start Main project js, jQuery, Bootstrap -->
<script src="../assets/bundles/lib.vendor.bundle.js"></script>

<!-- Start project main js  and page js -->
<script src="../assets/js/core.js"></script>
</body>
</html>


