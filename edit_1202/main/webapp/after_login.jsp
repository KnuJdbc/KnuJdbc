<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*"%>
     <jsp:useBean id="m" class="mpackage.Member" scope="request"/>
<jsp:useBean id="joinMember" class="mpackage.joinMember" scope="request"/>


<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Raleway:ital,wght@1,200&display=swap');
</style>
<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="">

  <title> Endangered animals </title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>

<body>
<%
	String ID =request.getParameter("ID");
	String pw =request.getParameter("pw");
	
%>
  <div class="hero_area">
    <div class="bg-box">
      <img src="images/icebear-2376861_1920.jpg" alt="">
    </div>
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <span>
           -
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
              <li class="nav-item active">
                <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="./search.jsp">All ANIMAL</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="./search_img.jsp">IMAGE</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="./statistics.jsp">STATISTICS</a>
              </li>
            <form class="form-inline" action="./get_info.html">
                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </form>
            </ul>
            
         
            <div class="user_option">
            <form name="user_form" method=post action="edit.jsp">
            <button class="btn my-2 my-sm-0 nav_search-brn" type="submit">
             <i class="fa fa-user" aria-hidden="true"></i>
<input type=hidden name="ID" value="<%=ID%>">
<input type=hidden name="pw" value="<%=pw%>">
</button>
 <br>
 <br>
</form>
            
          <!--      <a href="./edit.jsp" class="user_link">
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
             -->
              
              
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
    <!-- slider section -->
    <section class="slider_section ">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                 <h1>
                   Endangerd Animal
                    </h1>
                    <p>
						More than 41,000 speciesare threatened with extinction

That is still 28% of all assessed species.
                    </p>
                    <div class="btn-box">
                      <a href="" class="btn1">
                 <!--      Order Now    --> 
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="carousel-item">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                     <h1>
                   Projects
                    </h1>
                    <p>
						We work to ensure a sustainable future for all wildlife, </br>
						habitats and communities.
                    </p>
                
                    <div class="btn-box">
                      <a href="" class="btn1">
                        Order Now
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <ol class="carousel-indicators">
            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#customCarousel1" data-slide-to="1"></li>
            <li data-target="#customCarousel1" data-slide-to="2"></li>
          </ol>
        </div>
      </div>

    </section>
    <!-- end slider section -->
  </div>

  <!-- offer section -->


  <!-- end offer section -->
</br>

 

  <!-- food section -->

  <section class="food_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center"></br>
        <h2>
          ANIMAL 
        </h2> 
      </div> 

      <ul class="filters_menu">
        <li class="active" data-filter="*">All</li>
        <li data-filter=".cr">CR</li>
        <li data-filter=".en">EN</li>
        <li data-filter=".LT">NT</li>
        <li data-filter=".LC">LC</li>
      </ul>

      <div class="filters-content">
        <div class="row grid">
          <div class="col-sm-6 col-lg-4 all cr">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://wir.iucnredlist.org/trachypithecus-delacouri.jpg" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    델라쿠르랑구르</br>
                   
                  </h5>
                  <p>
                  
Hunting for the purposes of traditional "medicine" is the primary threat facing this species  
</br></br>             </p>
                  <div class="options">
                    <h6>
                       절멸 위급(CR, Critically Endangered) 
                      
                    </h6>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all LT">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://wir.iucnredlist.org/aptenodytes-forsteri.jpg" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    황제 펭귄 </br>
                  </h5>
                  <p>
The species is threatened by the effects of projected climate change      </br></br></br>           </p>
                  <div class="options">
                    <h6>
                      
                      준위협(NT, Near Threatened) 
                      
                    </h6>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all en">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://wir.iucnredlist.org/tapirus-indicus.jpg" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    말레이맥 </br>
                  </h5>
                  <p>
The primary threats to the species are large scale deforestation and increasingly, hunting.   </br></br>              <div class="options">
                    <h6>

절멸 위기(EN, Endangered)                    
 </h6>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all cr">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://wir.iucnredlist.org/diceros-bicornis.jpg" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    검은 코뿔소 </br>
                  </h5>
                  <p>
The main threat to the species is illegal hunting (poaching) to supply the illegal international rhino horn trade.     </br>    </br>         </p>
                  <div class="options">
                    <h6>
       절멸 위급(CR, Critically Endangered)      </h6>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all en">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://wir.iucnredlist.org/orcaella-brevirostris.jpg" alt="">
                </div>
                <div class="detail-box">
                  <h5>
강거두고래 </br>
                  </h5>
                  <p>
The most severe threat to most subpopulations is incidental mortality from entanglement in fishing gear, particularly gillnets.                   </p>
                  <div class="options">
                    <h6>
절멸 위기(EN, Endangered)
                    </h6>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all LC">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://wir.iucnredlist.org/alces-alces.jpg" alt="">
                </div>
                <div class="detail-box">
                  <h5>
말코손바닥사슴 </br>
                  </h5>
                  <p>
Threats to the status of the Alces alces populations are primarily human-caused habitat alteration.  </br></br>                </p>
                  <div class="options">
                    <h6>
                      최소 관심(LC, Least Concern)
                    </h6>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all cr">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://wir.iucnredlist.org/pithecophaga-jefferyi.jpg" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    필리핀 독수리
                    </br>
                  </h5>
                  <p>
Forest destruction and fragmentation, through commercial timber extraction and shifting cultivation, is the principal long-term threat.     </br>     </br></br>        </p>
                  <div class="options">
                    <h6>
절멸 위급(CR, Critically Endangered)                     </h6>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all en">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://wir.iucnredlist.org/reithrodontomy-_raviventris.jpg" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    아메리카 멧밭쥐</br>
                    
                  </h5>
                  <p>
This species is threatened by habitat destruction or disturbance due to development, residential encroachment, intrusion of fresh water into salt marshes, marsh subsidence, and predation (especially by house cats).                   </p>
                  <div class="options">
                    <h6>
                      절멸 위기(EN, Endangered)
                    </h6>
                   
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 all cr">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="https://wir.iucnredlist.org/squatina-squatina.jpg" alt="">
                </div>
                <div class="detail-box">
                  <h5>
전자리상어                    </br> 
                  </h5>
                  <p>
Degradation of important Angelshark habitat through unsustainable coastal development and coastal infrastructure is of concern, especially in nursery areas identified in shallow inshore waters   </br>     </br>          <div class="options">
                    <h6>
                     절멸 위급(CR, Critically Endangered)
                    </h6>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="btn-box">
        <a href="./get_info.html">
          View More
        </a>
      </div>
    </div>
  </section>

  <!-- end food section -->
 <!-- client section -->

  <section class="client_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center psudo_white_primary mb_45">
        <h2>
          IUCN RED LIST
        </h2>
      </div>
      <div class="carousel-wrap row ">
        <div class="owl-carousel client_owl-carousel">
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
개체가 하나도 남아 있지 않은 상태                </p>
                <h6>
                 절멸(EX)
                </h6>
                <p>
                  Extinct
                </p>
              </div>
              <div class="img-box">
                <img src="https://nrl.iucnredlist.org/assets/category-lg/category-lg_ex-5aa9fe2bfb20930fdec6d1c5b619f81b6e2fdd56de9d10984b0aef3801bcb9a2.svg" alt="" class="box-img">
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
원래의 서식지역이 아닌 곳에서만 인위적으로 유입되어 생존하고 있는 상태               </p>
                <h6>
                  야생 절멸(EW)
                </h6>
                <p>
                  Extinct in the Wild
                </p>
              </div>
              <div class="img-box">
                <img src="https://nrl.iucnredlist.org/assets/category-lg/category-lg_ew-d3e64d0f3ef6f89a4406dc6f882b9dafa6a3738fa2bb68e442523d42743d96df.svg" alt="" class="box-img">
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
야생에서 절멸할 가능성이 대단히 높은 상태                </p>
                <h6>
                 절멸 위급(CR)
                </h6>
                <p>
                 Critically Endangered
                </p>
              </div>
              <div class="img-box">
                <img src="https://nrl.iucnredlist.org/assets/category-lg/category-lg_cr-3ec06b34573557e2b90a84b1659eae2d61024950f7d28509519a5f7e3758b71e.svg" alt="" class="box-img">
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
야생에서 절멸할 가능성이 높은 상태
                </p>
                <h6>
                  절멸 위기(EN)
                </h6>
                <p>
                  Endangered
                </p>
              </div>
              <div class="img-box">
                <img src="https://nrl.iucnredlist.org/assets/category-lg/category-lg_en-3d09fbfbe01ad6207d5ba4226eb0d8ea2310317f027a8aabe3bbedb74857a309.svg" alt="" class="box-img">
              </div>
            </div>
          </div>
           <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
 야생에서 절멸 위기에 처할 가능성이 높은 상태               </p>
                <h6>
                 취약(VU)
                </h6>
                <p>
                 Vulnerable
                </p>
              </div>
              <div class="img-box">
                <img src="https://nrl.iucnredlist.org/assets/category-lg/category-lg_vu-a498d553d90492b82044d2046ee9d6a16af6fe94c9ab59529950a6f62ab1a9a1.svg" alt="" class="box-img">
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
가까운 장래에 야생에서 멸종 우려 위기에 처할 가능성이 높은 상태
         </p>
                <h6>
               준위협(NT)
                </h6>
                <p>
              Near Threatened 
                </p>
              </div>
              <div class="img-box">
                <img src="https://nrl.iucnredlist.org/assets/category-lg/category-lg_nt-b1b4d7e271e9257d722fa2e9e9f4c5619b658e6f1d88f4e7da8edf8bce2a7ccb.svg" alt="" class="box-img">
              </div>
            </div>
          </div>
          
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
위험이 낮고 위험 범주에 도달하지 않는 상태                  </p>
                <h6>
                 최소 관심(LC) 
                </h6>
                <p>
                Least Concern
                </p>
              </div>
              <div class="img-box">
                <img src="https://nrl.iucnredlist.org/assets/category-lg/category-lg_lc-d3731e342769efbfd4604f953cfe3c4301a901253deb5f835cbb08eec5f1bc02.svg" alt="" class="box-img">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end client section -->
  <!-- about section -->

  <section class="about_section layout_padding">
    <div class="container  ">

      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="images/iucn-redlist.jpg" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
               What is The IUCN Red List?
              </h2>
            </div>
            <p>
              Established in 1964, The International Union for Conservation of Nature’s Red List of Threatened Species has evolved to become the world’s most comprehensive information source on the global conservation status of animal, fungi and plant species.

The IUCN Red List is a critical indicator of the health of the world’s biodiversity. Far more than a list of species and their status, it is a powerful tool to inform and catalyze action for biodiversity conservation and policy change, critical to protecting the natural resources we need to survive. 
It provides information about range, population size, habitat and ecology, use and/or trade, threats, and conservation actions that will help inform necessary conservation decisions.
            </p>
            <a href="">
              Donate
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->

 


  <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-col">
          <div class="footer_contact">
            <h4>
              Contact Us
            </h4>
            <div class="contact_link_box">
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>
                  Location
                </span>
              </a>
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
                  Call +01 1234567890
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>
                  demo@gmail.com
                </span>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <div class="footer_detail">
            <a href="" class="footer-logo">
              Feane
            </a>
            <p>
              Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with
            </p>
            <div class="footer_social">
              <a href="">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-instagram" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-pinterest" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <h4>
            Opening Hours
          </h4>
          <p>
            Everyday
          </p>
          <p>
            10.00 Am -10.00 Pm
          </p>
        </div>
      </div>
      <div class="footer-info">
        <p>
          &copy; <span id="displayYear"></span> 
            <form name="user_form" method=post action="Delete.jsp">
            <button type="submit" value="회원 탈퇴">
          
<input type=hidden name="ID" value="<%=ID%>">
<input type=hidden name="pw" value="<%=pw%>">
</button>
 <br>
 <br>
</form>
          
 

        </p>
      </div>
    </div>
  </footer>
  <!-- footer section -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

</body>

</html>