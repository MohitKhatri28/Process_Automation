<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title Page-->
    <title>Sign Up</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Registration Form</h2>
                    <form action="<%= request.getContextPath() %>/register" method="POST">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Leader</label>
                                    <input class="input--style-4" type="text" placeholder="Full Name" name="leaderName">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Enrollment Number</label>
                                    <input class="input--style-4" type="text" name="leaderEnrollment">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Member 1</label>
                                    <input class="input--style-4" type="text" placeholder="Full Name" name="mem_1_Name">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Enrollment Number</label>
                                    <input class="input--style-4" type="text" name="mem_1_Enrollment">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Member 2</label>
                                    <input class="input--style-4" type="text" placeholder="Full Name" name="mem_2_Name">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Enrollment Number</label>
                                    <input class="input--style-4" type="text" name="mem_2_Enrollment">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Member 3</label>
                                    <input class="input--style-4" type="text" placeholder="Full Name" name="mem_3_Name">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Enrollment Number</label>
                                    <input class="input--style-4" type="text" name="mem_3_Enrollment">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Member 4</label>
                                    <input class="input--style-4" type="text" placeholder="Full Name" name="mem_4_Name">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Enrollment Number</label>
                                    <input class="input--style-4" type="text" name="mem_4_Enrollment">
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="input-group">
                            <label class="label">Prefered Areas</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="area_pref_1">
                                    <option disabled="disabled" selected="selected">Preference 1</option>
                                    <option value="1">AI/ML</option>
                                    <option value="2">DATA</option>
                                    <option value="3">Comp. Arch</option>
                                    <option value="4">Comp. Networks</option>
                                    <option value="5">Web & Appl. Design</option>
                                    <option value="6">S/W Engg.</option>
                                    <option value="7">Comp. Vision</option>
                                    <option value="8">Security</option>
                                    <option value="9">SYSTEMS</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                            <!-- <label class="label">Area 2</label> -->
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="area_pref_2">
                                    <option disabled="disabled" selected="selected">Preference 2</option>
                                    <option value="1">AI/ML</option>
                                    <option value="2">DATA</option>
                                    <option value="3">Comp. Arch</option>
                                    <option value="4">Comp. Networks</option>
                                    <option value="5">Web & Appl. Design</option>
                                    <option value="6">S/W Engg.</option>
                                    <option value="7">Comp. Vision</option>
                                    <option value="8">Security</option>
                                    <option value="9">SYSTEMS</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                            <!-- <label class="label">Area 3</label> -->
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="area_pref_3">
                                    <option disabled="disabled" selected="selected">Preference 3</option>
                                    <option value="1">AI/ML</option>
                                    <option value="2">DATA</option>
                                    <option value="3">Comp. Arch</option>
                                    <option value="4">Comp. Networks</option>
                                    <option value="5">Web & Appl. Design</option>
                                    <option value="6">S/W Engg.</option>
                                    <option value="7">Comp. Vision</option>
                                    <option value="8">Security</option>
                                    <option value="9">SYSTEMS</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <div class="input-group">
                            <label class="label">Prefered Guides</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="guide_pref_1">
                                    <option disabled="disabled" selected="selected">Preference 1</option>
                                    <option value="1">Guide 1</option>
                                    <option value="2">Guide 2</option>
                                    <option value="3">Guide 3</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                            <!-- <label class="label">Guide 2</label> -->
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="guide_pref_2">
                                    <option disabled="disabled" selected="selected">Preference 2</option>
                                    <option value="1">Guide 1</option>
                                    <option value="2">Guide 2</option>
                                    <option value="3">Guide 3</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                            <!-- <label class="label">Guide 3</label> -->
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="guide_pref_3">
                                    <option disabled="disabled" selected="selected">Preference 3</option>
                                    <option value="1">Guide 1</option>
                                    <option value="2">Guide 2</option>
                                    <option value="3">Guide 3</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Average CGPA</label>
                                    <input class="input--style-4" type="text" name="avg_cgpa">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Username</label>
                                    <input class="input--style-4" type="text" name="username">
                                </div>
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <input class="input--style-4" type="password" name="password">
                                </div>
                            </div>
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body>

</html>
