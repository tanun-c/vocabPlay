'use strict'

angular.module 'nisyvocabApp'
.controller 'MockSuperCtrl', ($scope, $timeout, $window) ->
  
  $scope.loaded = false
  # $scope.showFront = true

  # $window.onscroll = -> 
  #   scrollPos = document.body.scrollTop || document.documentElement.scrollTop || 0
  #   $scope.scrollPos = $scope.scrollPos || 0
  #   diffY = $scope.scrollPos - scrollPos

  #   if (diffY < 0 && $scope.showFront && scrollPos > 20 && !$scope.readingMode)
  #     $scope.readingMode = true
  #     $scope.$apply()

  #   if (scrollPos >= 105 && !$scope.showMenuBtn)
  #     $scope.showMenuBtn = true
  #     $scope.$apply()

  #   if (scrollPos < 105 && $scope.showMenuBtn)
  #     $scope.showMenuBtn = false
  #     $scope.$apply()

    # if 
    
    # $scope.fixNews = scrollPos < ($window.innerHeight / 2)
    # $scope.offsetCover = scrollPos
    # $scope.scrollPos = scrollPos

  # $scope.goSearchMode = ->
  #   $scope.readingMode = false
  #   $window.scrollTo(0,0) 


  # $scope.showFrontPane = ->
  #   $scope.showFront = true
  # $scope.hideFront = ->
  #   $scope.showFront = false

  $scope.show = 'news' if window.innerWidth >= 768

  $scope.slides = [
      image: 'http://www.eng.chula.ac.th/sites/default/files/sprailth-cue-13.jpg'
      caption: 'จดหมายข่าวรายเดือน'
      # active: true
  ]

  $scope.switch = (menu) ->
    $scope.menu = menu
    $scope.show = 'news'
    if (menu == 'department')
      $scope.submenu = []
      $scope.newsGroups = [
          subheader: 'ภาควิชา'
          news: departments
        ,
          subheader: 'หน่วยงาน'
          news: offices
      ]
    if (menu == 'news')
      $scope.submenu = [
          title: 'ข่าวทั่วไป'
        ,
          title: 'กำหนดการ'
        ,
          title: 'กิจกรรม'
        ,
          title: 'นิสิต'
        ,
          title: 'ทุนการศึกษา'
      ]
      $scope.newsGroups = [
          subheader: 'ข่าวล่าสุด'
          news: frontpageNews
      ]
    if (menu == 'about')
      $scope.submenu = [
          title: 'ประวัติคณะ'
        ,
          title: 'วิสัยทัศน์และพันธกิจ'
        ,
          title: 'การบริหาร'
        ,
          title: 'รางวัลศักดิ์อินทาเนีย'
        ,
          title: 'แนะนำคณะ'
        ,
          title: 'ปริญญากิตติมศักดิ์'
      ]
      $scope.newsGroups = [
          news: about
      ]

    if (menu == 'personnel')
      $scope.submenu = [
          title: 'เรียงตามภาควิชา'
        ,
          title: 'เรียงตามลำดับตัวอักษร'
        ,
          title: 'อาจารย์'
        ,
          title: 'บุคลากรสนับสนุน'
      ]
      $scope.newsGroups = [
          subheader: 'อาจารย์ใหม่'
          news: [
              caption: 'Jon Snow บุคลากรภาควิชาวิศวกรรมสิ่งแวดล้อม'
              image: 'http://www.independent.co.uk/incoming/article10319993.ece/binary/original/jon-snow.jpg'
            ,
              caption: 'Tyrion Lannister อาจารย์ภาควิชาวิศวกรรมสิ่งแวดล้อม'
              image: 'http://images.latintimes.com/sites/latintimes.com/files/2014/02/27/tyrion-lannister-1024.jpg'
          ]
      ]


  $scope.startSearch = () ->
    return false if ($scope.search.length < 3)
    $scope.loading = true
    $scope.loaded = false

    $timeout $scope.displayResult, 1000

  $scope.displayResult = () ->
    $scope.loaded = true
    search = $scope.search

    if search.length == 0
      $scope.loading = false
      $scope.loaded = false
      $scope.searchResults = []
      return
    
    result = _.filter data, (item) ->
      return true if item.name and item.name.indexOf(search) >= 0
      return true if item.description and item.description.indexOf(search) >= 0
      # return item.name.indexOf(search) > 0 || item.description.indexOf(search) > 0

    $scope.loading = false
    $scope.searchResults = result

  frontpageNews = [
      date: '07-Sep-2015'
      caption: 'ขอเชิญนิสิต คณาจารย์ บุคลากร และผู้ที่สนใจ เข้าร่วมฟังบรรยาย "How To innovate : A design thinking approach" '
      description: 'ขอเชิญผู้ที่สนใจ เข้าร่วมฟังบรรยายเกี่ยวกับแนวคิด Design Thinking เพื่อพัฒนาความคิดและทักษะในการเป็นนวัตกรสำหรับอนาคต จากผู้เชี่ยวชาญ คนรุ่นใหม่ ที่เคยเป็นผู้ช่วยสอนและที่ปรึกษาองค์กร จาก Stanford school ประเทศสหรัฐอเมริกา...'
      image: 'http://www.eng.chula.ac.th/sites/default/files/spotlight_khunkwiiwuthi.jpg'
    ,
      date: '3-Oct-2014'
      caption: 'ขอเชิญร่วมบริจาค กองทุนนวัตกรรม วิศวฯ จุฬาฯ (Innovation Endowment Fund)'
      # description: 'ขอเชิญผู้ที่สนใจ เข้าร่วมฟังบรรยายเกี่ยวกับแนวคิด Design Thinking เพื่อพัฒนาความคิดและทักษะในการเป็นนวัตกรสำหรับอนาคต จากผู้เชี่ยวชาญ คนรุ่นใหม่ ที่เคยเป็นผู้ช่วยสอนและที่ปรึกษาองค์กร จาก Stanford school ประเทศสหรัฐอเมริกา...'
      image: 'http://www.eng.chula.ac.th/sites/default/files/images/Page--spotlight%20%E0%B8%81%E0%B8%AD%E0%B8%87%E0%B8%97%E0%B8%B8%E0%B8%99%E0%B8%AB%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B8%AA%E0%B8%A1%E0%B8%B8%E0%B8%94.jpg'
    ,
      date: '08-Sep-2015'
      caption: 'คอลัมน์ 1001 หนังสือพิมพ์เดลินิวส์ : ความเป็นส่วนตัวในโลกดิจิตอล'
      description: 'สวัสดีครับ ในช่วงเดือนสิงหาคมที่ผ่านมามีข่าวเกี่ยวกับการเจาะระบบที่น่าสนใจข่าวหนึ่งที่อยากจะมาเล่าให้ฟังครับ ข่าวนี้เกี่ยวข้องกับความเป็นส่วนตัวในโลกออนไลน์ (Privacy) ...'
      image: 'http://www.dailynews.co.th/images/1154612?s=750x500'
    ,
      date: '08-Sep-2015'
      caption: 'งานบริหารการศึกษา ฝ่ายวิชาการ คณะวิศวกรรมศาสตร์ ได้จัดโครงการสัมมนาระดมความคิดเห็นจากผู้มีส่วนเกี่ยวข้องกับการปรับปรุงหลักสูตร (ระดับปริญญาตรี)'
      description: 'เมื่อวันที่ 31 สิงหาคม – 2 กันยายน 2558 งานบริหารการศึกษา ฝ่ายวิชาการ คณะวิศวกรรมศาสตร์ ได้จัดโครงการ "สัมมนาระดมความคิดเห็น...'
      image: 'http://www.eng.chula.ac.th/sites/default/files/images/11922854_10152930611706920_4104432915510630279_o.jpg'
    ,
      date: '07-Sep-2015'
      caption: 'ขอเชิญนิสิต คณาจารย์ บุคลากร และผู้ที่สนใจ เข้าร่วมฟังบรรยาย "How To innovate : A design thinking approach" '
      description: 'ขอเชิญผู้ที่สนใจ เข้าร่วมฟังบรรยายเกี่ยวกับแนวคิด Design Thinking เพื่อพัฒนาความคิดและทักษะในการเป็นนวัตกรสำหรับอนาคต จากผู้เชี่ยวชาญ คนรุ่นใหม่ ที่เคยเป็นผู้ช่วยสอนและที่ปรึกษาองค์กร จาก Stanford school ประเทศสหรัฐอเมริกา...'
      image: 'http://www.eng.chula.ac.th/sites/default/files/spotlight_khunkwiiwuthi.jpg'
    ,
      date: '3-Oct-2014'
      caption: 'ขอเชิญร่วมบริจาค กองทุนนวัตกรรม วิศวฯ จุฬาฯ (Innovation Endowment Fund)'
      # description: 'ขอเชิญผู้ที่สนใจ เข้าร่วมฟังบรรยายเกี่ยวกับแนวคิด Design Thinking เพื่อพัฒนาความคิดและทักษะในการเป็นนวัตกรสำหรับอนาคต จากผู้เชี่ยวชาญ คนรุ่นใหม่ ที่เคยเป็นผู้ช่วยสอนและที่ปรึกษาองค์กร จาก Stanford school ประเทศสหรัฐอเมริกา...'
      image: 'http://www.eng.chula.ac.th/sites/default/files/images/Page--spotlight%20%E0%B8%81%E0%B8%AD%E0%B8%87%E0%B8%97%E0%B8%B8%E0%B8%99%E0%B8%AB%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B8%AA%E0%B8%A1%E0%B8%B8%E0%B8%94.jpg'
    ,
      date: '08-Sep-2015'
      caption: 'คอลัมน์ 1001 หนังสือพิมพ์เดลินิวส์ : ความเป็นส่วนตัวในโลกดิจิตอล'
      description: 'สวัสดีครับ ในช่วงเดือนสิงหาคมที่ผ่านมามีข่าวเกี่ยวกับการเจาะระบบที่น่าสนใจข่าวหนึ่งที่อยากจะมาเล่าให้ฟังครับ ข่าวนี้เกี่ยวข้องกับความเป็นส่วนตัวในโลกออนไลน์ (Privacy) ...'
      image: 'http://www.dailynews.co.th/images/1154612?s=750x500'
    ,
      date: '08-Sep-2015'
      caption: 'งานบริหารการศึกษา ฝ่ายวิชาการ คณะวิศวกรรมศาสตร์ ได้จัดโครงการสัมมนาระดมความคิดเห็นจากผู้มีส่วนเกี่ยวข้องกับการปรับปรุงหลักสูตร (ระดับปริญญาตรี)'
      description: 'เมื่อวันที่ 31 สิงหาคม – 2 กันยายน 2558 งานบริหารการศึกษา ฝ่ายวิชาการ คณะวิศวกรรมศาสตร์ ได้จัดโครงการ "สัมมนาระดมความคิดเห็น...'
      image: 'http://www.eng.chula.ac.th/sites/default/files/images/11922854_10152930611706920_4104432915510630279_o.jpg'
    ,
      date: '07-Sep-2015'
      caption: 'ขอเชิญนิสิต คณาจารย์ บุคลากร และผู้ที่สนใจ เข้าร่วมฟังบรรยาย "How To innovate : A design thinking approach" '
      description: 'ขอเชิญผู้ที่สนใจ เข้าร่วมฟังบรรยายเกี่ยวกับแนวคิด Design Thinking เพื่อพัฒนาความคิดและทักษะในการเป็นนวัตกรสำหรับอนาคต จากผู้เชี่ยวชาญ คนรุ่นใหม่ ที่เคยเป็นผู้ช่วยสอนและที่ปรึกษาองค์กร จาก Stanford school ประเทศสหรัฐอเมริกา...'
      image: 'http://www.eng.chula.ac.th/sites/default/files/spotlight_khunkwiiwuthi.jpg'
    ,
      date: '3-Oct-2014'
      caption: 'ขอเชิญร่วมบริจาค กองทุนนวัตกรรม วิศวฯ จุฬาฯ (Innovation Endowment Fund)'
      # description: 'ขอเชิญผู้ที่สนใจ เข้าร่วมฟังบรรยายเกี่ยวกับแนวคิด Design Thinking เพื่อพัฒนาความคิดและทักษะในการเป็นนวัตกรสำหรับอนาคต จากผู้เชี่ยวชาญ คนรุ่นใหม่ ที่เคยเป็นผู้ช่วยสอนและที่ปรึกษาองค์กร จาก Stanford school ประเทศสหรัฐอเมริกา...'
      image: 'http://www.eng.chula.ac.th/sites/default/files/images/Page--spotlight%20%E0%B8%81%E0%B8%AD%E0%B8%87%E0%B8%97%E0%B8%B8%E0%B8%99%E0%B8%AB%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B8%AA%E0%B8%A1%E0%B8%B8%E0%B8%94.jpg'
    ,
      date: '08-Sep-2015'
      caption: 'คอลัมน์ 1001 หนังสือพิมพ์เดลินิวส์ : ความเป็นส่วนตัวในโลกดิจิตอล'
      description: 'สวัสดีครับ ในช่วงเดือนสิงหาคมที่ผ่านมามีข่าวเกี่ยวกับการเจาะระบบที่น่าสนใจข่าวหนึ่งที่อยากจะมาเล่าให้ฟังครับ ข่าวนี้เกี่ยวข้องกับความเป็นส่วนตัวในโลกออนไลน์ (Privacy) ...'
      image: 'http://www.dailynews.co.th/images/1154612?s=750x500'
    ,
      date: '08-Sep-2015'
      caption: 'งานบริหารการศึกษา ฝ่ายวิชาการ คณะวิศวกรรมศาสตร์ ได้จัดโครงการสัมมนาระดมความคิดเห็นจากผู้มีส่วนเกี่ยวข้องกับการปรับปรุงหลักสูตร (ระดับปริญญาตรี)'
      description: 'เมื่อวันที่ 31 สิงหาคม – 2 กันยายน 2558 งานบริหารการศึกษา ฝ่ายวิชาการ คณะวิศวกรรมศาสตร์ ได้จัดโครงการ "สัมมนาระดมความคิดเห็น...'
      image: 'http://www.eng.chula.ac.th/sites/default/files/images/11922854_10152930611706920_4104432915510630279_o.jpg'
  ]

  data = [
      name: 'รศ.ดร.พิสุทธิ์ เพียรมนกุล',
      description: 'อาจารย์ภาควิชาวิศวกรรมสิ่งแวดล้อม'
      category: 'personnel'
      category_local: 'บุคลากร'
      image: 'pisut.jpg'
    ,
      name: 'ผศ.ดร.มาโนช โลหเตปานนท์',
      description: 'อาจารย์ภาควิชาภาควิชาวิศวกรรมโยธา'
      category: 'personnel'
      category_local: 'บุคลากร'
      image: '34.jpg'
    ,
      name: 'ผศ.ดร.มาโนช โลหเตปานนท์',
      description: 'รองคณบดี ด้านสื่อสารองค์กรและวิรัชกิจ'
      category: 'personnel'
      category_local: 'บุคลากร'
      image: '34.jpg'
    ,
      name: 'รศ.ดร.พิสุทธิ์ เพียรมนกุล',
      description: 'ผู้ช่วยคณบดี ฝ่ายประชาสัมพันธ์'
      category: 'admin'
      category_local: 'ผู้บริหาร'
      image: 'pisut.jpg'
    ,
      name: 'รศ.ดร.อติวงศ์ สุชาโต',
      description: 'อาจารย์ภาควิชาวิศวกรรมคอมพิวเตอร์'
      category: 'admin'
      category_local: 'ผู้บริหาร'
      image: '412.jpg'
    ,
      name: 'รศ.ดร.อติวงศ์ สุชาโต',
      description: 'ผู้ช่วยคณบดี ด้านสารสนเทศ'
      category: 'admin'
      category_local: 'ผู้บริหาร'
      image: '412.jpg'
    ,
      name: 'ภาควิชาวิศวกรรมสิ่งแวดล้อม'
      category: 'department'
      category_local: 'หน่วยงาน'
      description: 'อาคารวิศวกรรมสิ่งแวดล้อม โทร: 0-2218-6667'
    ,
      name: 'หน่วยประชาสัมพันธ์'
      category: 'department'
      category_local: 'หน่วยงาน'
      description: 'อาคาร 3 โทร: 0-2218-6337'
    ,
      name: 'วันเปิดเรียน ภาคต้น ปี 2558'
      category: 'department'
      category_local: 'หน่วยงาน'
      description: '10 สิงหาคม 2558'
      image: 'calendar.png'
    ,
      name: 'วันสุดท้ายของการถอนรายวิชา ภาคต้น ปี 2558'
      category: 'department'
      category_local: 'หน่วยงาน'
      image: 'calendar.png'
      description: '30 ตุลาคม 2558'
    ,
      name: 'ความคืบหน้าการปรับปรุงห้องสมุดคณะวิศวฯ จุฬาฯ'
      category: 'news'
      category_local: 'ข่าว'
      description: 'หนึ่งในผลงานจากกองทุนนวัตกรรม ที่สร้างสรรค์ห้องสมุด Smart Library'
    ,
      name: 'แบบฟอร์มเบิกเงินสนับสนุนการฝึกงาน'
      category: 'news'
      category_local: 'ข่าว'
      description: ''
      image: 'longbanner_news.jpg'
  ]

  departments = [
      caption: 'วิศวกรรมโยธา'
      description: 'ขอเชิญผู้ที่สนใจ เข้าร่วมฟังบรรยายเกี่ยวกับแนวคิด Design Thinking เพื่อพัฒนาความคิดและทักษะในการเป็นนวัตกรสำหรับอนาคต จากผู้เชี่ยวชาญ คนรุ่นใหม่ ที่เคยเป็นผู้ช่วยสอนและที่ปรึกษาองค์กร จาก Stanford school ประเทศสหรัฐอเมริกา...'
      image: 'http://www.civil.eng.chula.ac.th/sites/all/themes/civilchula/images/civil-chula-image-building1.jpg'
    ,
      caption: 'วิศวกรรมสิ่งแวดล้อม'
      # description: 'ขอเชิญผู้ที่สนใจ เข้าร่วมฟังบรรยายเกี่ยวกับแนวคิด Design Thinking เพื่อพัฒนาความคิดและทักษะในการเป็นนวัตกรสำหรับอนาคต จากผู้เชี่ยวชาญ คนรุ่นใหม่ ที่เคยเป็นผู้ช่วยสอนและที่ปรึกษาองค์กร จาก Stanford school ประเทศสหรัฐอเมริกา...'
      image: 'http://thaipublica.org/wp-content/uploads/2015/08/%E0%B9%82%E0%B8%AD-620x349.jpg'
    ,
      caption: 'วิศวกรรมคอมพิวเตอร์'
      image: 'https://scontent.fbkk4-1.fna.fbcdn.net/hphotos-frc3/v/t1.0-0/p206x206/6955_615578628453616_571926169_n.jpg?oh=894dc0b7b8cf9ce1c597e5ad14249609&oe=569A0AE9'
    ,
      caption: 'วิศวกรรมอุตสาหการ'
      description: 'เมื่อวันที่ 31 สิงหาคม – 2 กันยายน 2558 งานบริหารการศึกษา ฝ่ายวิชาการ คณะวิศวกรรมศาสตร์ ได้จัดโครงการ "สัมมนาระดมความคิดเห็น...'
      image: 'http://www.eng.chula.ac.th/sites/default/files/images/11922854_10152930611706920_4104432915510630279_o.jpg'
  ]

  offices = [
      caption: 'สำนักทะเบียน'
    ,
      caption: 'ฝ่ายประชาสัมพันธ์'
      # description: 'ขอเชิญผู้ที่สนใจ เข้าร่วมฟังบรรยายเกี่ยวกับแนวคิด Design Thinking เพื่อพัฒนาความคิดและทักษะในการเป็นนวัตกรสำหรับอนาคต จากผู้เชี่ยวชาญ คนรุ่นใหม่ ที่เคยเป็นผู้ช่วยสอนและที่ปรึกษาองค์กร จาก Stanford school ประเทศสหรัฐอเมริกา...'
      # image: 'http://www.civil.eng.chula.ac.th/sites/all/themes/civilchula/images/civil-chula-image-building1.jpg'
    ,
      caption: 'ฝ่ายวิรัชกิจ'
      # description: 'ขอเชิญผู้ที่สนใจ เข้าร่วมฟังบรรยายเกี่ยวกับแนวคิด Design Thinking เพื่อพัฒนาความคิดและทักษะในการเป็นนวัตกรสำหรับอนาคต จากผู้เชี่ยวชาญ คนรุ่นใหม่ ที่เคยเป็นผู้ช่วยสอนและที่ปรึกษาองค์กร จาก Stanford school ประเทศสหรัฐอเมริกา...'
      # image: 'http://thaipublica.org/wp-content/uploads/2015/08/%E0%B9%82%E0%B8%AD-620x349.jpg'
    ,
      caption: 'ฝ่ายกิจการนิสิต'
      # image: 'https://scontent.fbkk4-1.fna.fbcdn.net/hphotos-frc3/v/t1.0-0/p206x206/6955_615578628453616_571926169_n.jpg?oh=894dc0b7b8cf9ce1c597e5ad14249609&oe=569A0AE9'
    ,
      caption: 'ฝ่ายวิจัย'
      # description: 'เมื่อวันที่ 31 สิงหาคม – 2 กันยายน 2558 งานบริหารการศึกษา ฝ่ายวิชาการ คณะวิศวกรรมศาสตร์ ได้จัดโครงการ "สัมมนาระดมความคิดเห็น...'
      # image: 'http://www.eng.chula.ac.th/sites/default/files/images/11922854_10152930611706920_4104432915510630279_o.jpg'
  ]

  about = [
      caption: 'คณะผู้บริหาร'
    ,
      caption: 'วีดิทัศน์ 100 ปี วิศวฯ จุฬาฯ'
    ,
      caption: 'วิดีทัศน์แนะนำ open house'
  ]

  $scope.newsGroups = [
      subheader: 'ข่าวล่าสุด'
      news: frontpageNews
  ]