document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    }
    else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const submitFav = (e) => {
    e.preventDefault();

    const favInput = document.querySelector(".favorite-input");
    const fav = favInput.value;
    favInput.value = "";

    const newLi = document.createElement("li");
    newLi.textContent = fav;

    const favList = document.getElementById("sf-places");
    favList.appendChild(newLi);
  };

  const listSubmit = document.querySelector(".favorite-submit");
  listSubmit.addEventListener("click", submitFav);



  // adding new photos

  const showPhoto = (e) => {
    const photoDiv = document.querySelector(".photo-form-container");
    if (photoDiv.className === "photo-form-container") {
      photoDiv.className = "photo-form-container hidden";
    }
    else {
      photoDiv.className = "photo-form-container";
    }
  };

  const photoShow = document.querySelector(".photo-show-button");
  photoShow.addEventListener("click", showPhoto);


  const submitPhoto = (e) => {
    e.preventDefault();

    const photoIn = document.querySelector(".photo-url-input");
    const photo = photoIn.value;
    photoIn.value = "";

    const newImg = document.createElement("img");
    newImg.src = photo;

    const photoLi = document.createElement("li");
    photoLi.appendChild(newImg);

    const photoList = document.querySelector(".dog-photos");
    photoList.appendChild(photoLi);
  };

  const photoSubmit = document.querySelector(".photo-url-submit");
  photoSubmit.addEventListener("click", submitPhoto);
});
