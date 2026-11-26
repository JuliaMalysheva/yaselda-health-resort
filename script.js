document.addEventListener("DOMContentLoaded", function () {
  const burgerOpenBtn = document.getElementById("burger-menu-butt");
  const burgerMenu = document.querySelector(".burger-menu-inside");
  const burgerCloseBtn = document.querySelector(".burger-menu-close");

  function openMenu() {
    if (burgerMenu) {
      burgerMenu.classList.add("active");
      document.body.style.overflow = "hidden";
    }
  }

  function closeMenu() {
    if (burgerMenu) {
      burgerMenu.classList.remove("active");
      document.body.style.overflow = "";
    }
  }

  if (burgerOpenBtn) {
    burgerOpenBtn.addEventListener("click", openMenu);
  }

  if (burgerCloseBtn) {
    burgerCloseBtn.addEventListener("click", closeMenu);
  }

  const menuLinks = document.querySelectorAll(".burger a");
  menuLinks.forEach((link) => {
    link.addEventListener("click", closeMenu);
  });

  window.addEventListener("resize", function () {
    if (
      window.innerWidth > 768 &&
      burgerMenu &&
      burgerMenu.classList.contains("active")
    ) {
      closeMenu();
    }
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const img1 = document.getElementById("aboutimg1");
  const img2 = document.getElementById("aboutimg2");

  if (img1 && img2) {
    img1.addEventListener("mouseenter", function () {
      if (img1.classList.contains("image1-style")) {
        img1.classList.remove("image1-style");
        img1.classList.add("image2-style");
        img2.classList.remove("image2-style");
        img2.classList.add("image1-style");
      } else {
        img1.classList.remove("image2-style");
        img1.classList.add("image1-style");
        img2.classList.remove("image1-style");
        img2.classList.add("image2-style");
      }
    });

    img2.addEventListener("mouseenter", function () {
      if (img2.classList.contains("image2-style")) {
        img2.classList.remove("image2-style");
        img2.classList.add("image1-style");
        img1.classList.remove("image1-style");
        img1.classList.add("image2-style");
      } else {
        img2.classList.remove("image1-style");
        img2.classList.add("image2-style");
        img1.classList.remove("image2-style");
        img1.classList.add("image1-style");
      }
    });
  }

  const containerSlides = document.querySelectorAll(
    ".dr-gallery, .room-gallery",
  );
  containerSlides.forEach((sliderContainer) => {
    const slideScroll = sliderContainer.querySelector(".slides, .slides-room");
    const slides = sliderContainer.querySelectorAll(".slide, .slide-room");
    const left = sliderContainer.querySelector(".nav-area.left");
    const right = sliderContainer.querySelector(".nav-area.right");

    if (!slideScroll || slides.length === 0 || !left || !right) {
      return;
    }
    slideScroll.appendChild(slides[0].cloneNode(true));
    slideScroll.insertBefore(
      slides[slides.length - 1].cloneNode(true),
      slides[0],
    );
    const allSlides = sliderContainer.querySelectorAll(".slide, .slide-room");
    const totalSlides = allSlides.length;

    let ind = 1;
    function updateSlider(animateWork = true) {
      if (!animateWork) {
        slideScroll.style.transition = "none";
      } else {
        slideScroll.style.transition = "transform 0.5s ease";
      }
      slideScroll.style.transform = `translateX(-${ind * 100}%)`;
    }

    updateSlider(false);
    left.addEventListener("click", () => {
      ind--;
      updateSlider();
    });
    right.addEventListener("click", () => {
      ind++;
      updateSlider();
    });
    slideScroll.addEventListener("transitionend", () => {
      if (ind === 0) {
        slideScroll.style.transition = "none";
        ind = totalSlides - 2;
        slideScroll.style.transform = `translateX(-${ind * 100}%)`;
      }
      if (ind === totalSlides - 1) {
        slideScroll.style.transition = "none";
        ind = 1;
        slideScroll.style.transform = `translateX(-${ind * 100}%)`;
      }
    });
  });

  const buttonSections = document.querySelectorAll(".contacs-sections p");
  const infoBlocks = document.querySelectorAll(".contacts-info1");

  infoBlocks.forEach((block, index) => {
    if (index !== 0) {
      block.classList.add("hidden-contacts-info");
    }
  });

  buttonSections.forEach((item, index) => {
    item.addEventListener("click", () => {
      infoBlocks.forEach((block) => {
        block.classList.add("hidden-contacts-info");
        block.classList.remove("visible-contactsinfo");
      });
      infoBlocks[index].classList.remove("hidden-contacts-info");
      infoBlocks[index].classList.add("visible-contactsinfo");

      buttonSections.forEach((btn) => {
        btn.classList.remove("font-size48");
        btn.classList.add("font-size20");
      });

      item.classList.remove("font-size20");
      item.classList.add("font-size48");
    });
  });

  const counters = document.querySelectorAll("#counter");
  const speed = 120;
  const observer = new IntersectionObserver(
    (entries, observer) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const counter = entry.target;
          startCounter(counter);
          observer.unobserve(counter);
        }
      });
    },
    {
      threshold: 0.3,
      rootMargin: "0px",
    },
  );

  function startCounter(counter) {
    const updateCount = () => {
      const target = +counter.getAttribute("data-target");
      const currentText = counter.innerText.replace("+", "");
      const count = +currentText;
      const increment = target / speed;
      if (count < target) {
        counter.innerText = Math.ceil(count + increment) + "+";
        setTimeout(updateCount, 20);
      } else {
        counter.innerText = target + "+";
      }
    };
    updateCount();
  }

  counters.forEach((counter) => {
    observer.observe(counter);
    if (!counter.hasAttribute("data-original-target")) {
      counter.setAttribute(
        "data-original-target",
        counter.getAttribute("data-target"),
      );
    }
  });
});

document.addEventListener("DOMContentLoaded", () => {
  function initSlider(gallerySelector, trackSelector) {
    const galleries = document.querySelectorAll(gallerySelector);

    galleries.forEach((gallery) => {
      const track = gallery.querySelector(trackSelector);
      const btnLeft = gallery.querySelector(".nav-area.left");
      const btnRight = gallery.querySelector(".nav-area.right");

      if (!track || !btnLeft || !btnRight) return;

      let offset = 0;
      const slideWidth = track.children[0].offsetWidth + 20;
      const maxOffset = -(
        slideWidth *
        (track.children.length - Math.floor(gallery.offsetWidth / slideWidth))
      );

      function updateSlider() {
        track.style.transform = `translateX(${offset}px)`;
      }

      btnRight.addEventListener("click", () => {
        offset -= slideWidth;
        if (offset < maxOffset) offset = maxOffset;
        updateSlider();
      });

      btnLeft.addEventListener("click", () => {
        offset += slideWidth;
        if (offset > 0) offset = 0;
        updateSlider();
      });
      window.addEventListener("resize", () => {
        offset = 0;
        updateSlider();
      });
    });
  }
  initSlider(".morerooms-gallery", ".block-morerooms");
  initSlider(".proc-gallery", ".procedures");
  initSlider(".proc-gallery", ".procedures");
});

document.addEventListener("DOMContentLoaded", function () {
  const mobileBtn = document.getElementById("contactsMobileBtn");
  const mobileDropdown = document.getElementById("contactsMobileDropdown");
  const mobileSections = document.querySelectorAll(".contacts-mobile-section");
  const mobileInfoBlocks = document.querySelectorAll(
    ".contacts-mobile-info-block",
  );
  const selectedSpan = document.getElementById("selectedContactItem");

  if (!mobileBtn || !mobileDropdown) return;
  mobileBtn.addEventListener("click", function (e) {
    e.stopPropagation();
    mobileDropdown.classList.toggle("open");
    mobileBtn.classList.toggle("open");
  });

  document.addEventListener("click", function (e) {
    if (!mobileBtn.contains(e.target) && !mobileDropdown.contains(e.target)) {
      mobileDropdown.classList.remove("open");
      mobileBtn.classList.remove("open");
    }
  });

  mobileSections.forEach(function (section) {
    section.addEventListener("click", function () {
      const index = parseInt(this.getAttribute("data-index"));
      mobileSections.forEach(function (sec) {
        sec.classList.remove("active-mobile-section");
      });
      this.classList.add("active-mobile-section");

      const sectionText = this.textContent;
      if (selectedSpan) {
        selectedSpan.textContent = sectionText;
      }

      mobileInfoBlocks.forEach(function (block) {
        block.classList.remove("active-mobile-info");
        const blockIndex = parseInt(block.getAttribute("data-info"));
        if (blockIndex === index) {
          block.classList.add("active-mobile-info");
        }
      });

      mobileDropdown.classList.remove("open");
      mobileBtn.classList.remove("open");
    });
  });
});
