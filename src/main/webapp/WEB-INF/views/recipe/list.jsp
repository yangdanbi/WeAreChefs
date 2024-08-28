<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>recipeList</title>
<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>

<style>
.form-container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.form-wrapper {
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
}

.form-item {
	margin-bottom: 15px;
}
 .form-control {
        width: 100%;
    }
    	.ck.ck-editor{
	   max-width: 1000px;
  }
  .ck-editor__editable {
     min-height: 400px;
     max-height: 600px;
  }
  .ck-content { 
	  font-size: 12px; 
	 }
   .fruite-item {
      height: 350px;
      /* 원하는 높이로 설정 */
      display: flex;
      flex-direction: column;
  }
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>
	<!-- Hero Start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">레시피 목록</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="#">Home</a></li>
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active text-white">recipeList</li>
		</ol>
	</div>
	<div class="container-fluid py-5">
		<div class="container py-5">
			<h3 class="mb-4" style="text-align: center;">🍽️레시피</h3>
			<div class="form-container">
			
				<div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
								<form action="/recipe/list" method="get" id="frm">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="레시피명을 검색하세요." aria-describedby="search_icon" name="search">
                                    <span id="search_icon" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
							</form>
                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                               <%--  <h3>${param.kind}</h3> --%>
									<label for="order">분류</label>
									<form action="/recipe/list" method="get" id="order_frm">
										<input type="hidden" id="kindfrm" data-kind-frm="${param.kind}" name="kind">
                                    	<select id="order" name="order" class="border-0 form-select-sm bg-light me-3">
	                                        <option value="date_up" id="date_up">최신순</option>
	                                        <option value="date_down" id="date_down">과거순</option>
	                                        <option value="hit" id="date_down">인기순</option>    
                                    	</select>
                                	</form>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                             <c:forEach items="${count}" var="cnt">
                                          
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="/recipe/list?kind=${cnt.RECIPE_CATEGORY}"><i class="fas fa-apple-alt me-2"></i>${cnt.RECIPE_CATEGORY}</a>
                                                        <span>(${cnt.COUNT})</span>
                                                    </div>
                                                </li>   
                                               </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                               
                                   
                                    <div class="col-lg-12">
                                        <div class="position-relative">
                                            <img src="/resources/img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                            <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                                            </div>
                                        </div>
                                    </div>
                                     <a href="/recipe/add" class="btn border border-secondary rounded-pill px-3 text-primary" ><i class="fa me-2 text-primary"></i>🧑‍🍳레시피 작성 </a>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                   <c:forEach items="${ar}" var="recipe" >
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                               <img src="/resources/upload/recipes/${recipe.recipeImgFileDTO.file_name}" class="img-fluid w-100 rounded-top" alt="">
                                               
                                            </div>
                                           <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${recipe.recipe_category}</div> 
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                 <h4>${recipe.recipe_name}</h4>
		                                                <p> ${recipe.menu_recipe}</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap" style="margin-left:32px;">
                                                    
                                                    <a href="/recipe/detail?recipe_num=${recipe.recipe_num}" class="btn border border-secondary rounded-pill px-3 text-primary" ><i class="fa me-2 text-primary"></i>🧑‍🍳레시피 보러가기 </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                  	 </c:forEach>
                                    </div>
                                        <div class="pagination d-flex justify-content-center mt-5">
							                  <nav aria-label="Page navigation example">
													<a href="/recipe/list?page=${recipePager.startNum-1}&search=${recipePager.search}&kind=${recipePager.kind}&order=${recipePager.order}" 
														class="btn rounded ${recipePager.pre?'':'disabled'}" >&laquo;</a>
		                                        <c:forEach begin="${recipePager.startNum}" end="${recipePager.lastNum}" step="1" var="i">
		                                            <a href="/recipe/list?page=${i}&search=${recipePager.search}&kind=${recipePager.kind}&order=${recipePager.order}" 
		                                            	class="page-link d-inline rounded">${i}</a>
		                                        </c:forEach>
		                                        <!-- 다음버튼 -->
		                                        	<a href="/recipe/list?page=${recipePager.lastNum+1}&search=${recipePager.search}&kind=${recipePager.kind}&order=${recipePager.order}" 
		                                        		class="btn rounded ${recipePager.next?'':'disabled'}">&raquo;</a> 
							                 </nav>
							            </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</div> 
	 </div>




	<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/files.js"></script>
<script type="text/javascript" src="/resources/js/recipe/recipeList.js"></script>

</html>
								