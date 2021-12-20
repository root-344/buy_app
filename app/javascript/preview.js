// 商品画像（出品）
  document.addEventListener('DOMContentLoaded', function(){
      const ImageList = document.getElementById('image-list');
      if (!ImageList){ return false;}

      const createImageHTML = (blob) => {
        const imageElement = document.createElement('div');
  
        const blobImage = document.createElement('img');
        blobImage.setAttribute('class', 'image-file')
        blobImage.setAttribute('src', blob);
  
        imageElement.appendChild(blobImage);
        ImageList.appendChild(imageElement);
      };
  
      document.getElementById('item-image').addEventListener('change', function(e){
        const imageContent = document.querySelector('img');
        if (imageContent){
          imageContent.remove();
        }
  
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
  
        createImageHTML(blob);
      });
    });
//商品画像（編集）
  document.addEventListener('DOMContentLoaded', function(){
      const editList = document.getElementById('image-edit-list');
      if (!editList){ return false;}

      const createImageHTML = (blob) => {
        const imageElement = document.createElement('div');
  
        const blobImage = document.createElement('img');
        blobImage.setAttribute('class', 'image-file')
        blobImage.setAttribute('src', blob);
  
        imageElement.appendChild(blobImage);
        editList.appendChild(imageElement);
      };
  
      document.getElementById('item-edit-image').addEventListener('change', function(e){
        const imageContent = document.querySelector('img');
        if (imageContent){
          imageContent.remove();
        }
  
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
  
        createImageHTML(blob);
      });
    });

  // 出品者画像（新規登録）
    document.addEventListener('DOMContentLoaded', function(){
      const farmImageList = document.getElementById('farm-image-list');
      if (!farmImageList){ return false;}

      const createImageHTML = (blob) => {
        const imageElement = document.createElement('div');

        const blobImage = document.createElement('img');
        blobImage.setAttribute('class', 'image-file')
        blobImage.setAttribute('src', blob);

        imageElement.appendChild(blobImage);
        farmImageList.appendChild(imageElement);
      };

      document.getElementById('farm-image').addEventListener('change', function(e){
        const farmImageContent = document.querySelector('img');
        if (farmImageContent){
          farmImageContent.remove();
        }

        const File = e.target.files[0];
        const blob = window.URL.createObjectURL(File);

        createImageHTML(blob);
      });
    });
  // 出品者画像（編集）  
    document.addEventListener('DOMContentLoaded', function(){
      const farmEditList = document.getElementById('farm-edit-image-list');
      if (!farmEditList){ return false;}

      const createImageHTML = (blob) => {
        const imageElement = document.createElement('div');

        const blobImage = document.createElement('img');
        blobImage.setAttribute('class', 'image-file')
        blobImage.setAttribute('src', blob);

        imageElement.appendChild(blobImage);
        farmEditList.appendChild(imageElement);
      };

      document.getElementById('farm-edit-image').addEventListener('change', function(e){
        const imageContent = document.querySelector('img');
        if (imageContent){
          imageContent.remove();
        }

        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);

        createImageHTML(blob);
      });
    });

    // 購入者画像（新規登録）
    document.addEventListener('DOMContentLoaded', function(){
      const storeImageList = document.getElementById('store-image-list');
      if (!storeImageList){ return false;}

      const createImageHTML = (blob) => {
        const imageElement = document.createElement('div');

        const blobImage = document.createElement('img');
        blobImage.setAttribute('class', 'image-file')
        blobImage.setAttribute('src', blob);

        imageElement.appendChild(blobImage);
        storeImageList.appendChild(imageElement);
      };

      document.getElementById('store-image').addEventListener('change', function(e){
        const farmImageContent = document.querySelector('img');
        if (farmImageContent){
          farmImageContent.remove();
        }

        const File = e.target.files[0];
        const blob = window.URL.createObjectURL(File);

        createImageHTML(blob);
      });
    });
  // 購入者画像（編集）  
    document.addEventListener('DOMContentLoaded', function(){
      const storeEditList = document.getElementById('store-edit-image-list');
      if (!storeEditList){ return false;}

      const createImageHTML = (blob) => {
        const imageElement = document.createElement('div');

        const blobImage = document.createElement('img');
        blobImage.setAttribute('class', 'image-file')
        blobImage.setAttribute('src', blob);

        imageElement.appendChild(blobImage);
        storeEditList.appendChild(imageElement);
      };

      document.getElementById('store-edit-image').addEventListener('change', function(e){
        const imageContent = document.querySelector('img');
        if (imageContent){
          imageContent.remove();
        }

        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);

        createImageHTML(blob);
      });
    });

  //複数枚画像投稿機能実装時に使用
// if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
// document.addEventListener('DOMContentLoaded', function() {
  
//   const ImageList = document.getElementById('image-list');

//   const createImageHTML = (blob) => {
//     const imageElement = document.createElement('div');
//     imageElement.setAttribute('class', "image-element");
//     let imageElementNum = document.querySelectorAll('.image-element').length;

//     const blobImage = document.createElement('img');
//     blobImage.setAttribute('src', blob);

      
//     if(imageElementNum<2){
//     const inputHTML = document.createElement('input');
//     inputHTML.setAttribute('id',  `item_image_${imageElementNum}`);
//     inputHTML.setAttribute('name','item[images][]');
//     inputHTML.setAttribute('type', 'file');

//     imageElement.appendChild(blobImage);
//     imageElement.appendChild(inputHTML);
//     ImageList.appendChild(imageElement);
  
//     inputHTML.addEventListener('change', (e) => {
//       file = e.target.files[0];
//       blob = window.URL.createObjectURL(file);
//       createImageHTML(blob);
//     });
//   } else if(imageElementNum == 2) {
//     imageElement.appendChild(blobImage);
//     ImageList.appendChild(imageElement);
//   } else {
//       const imageContent = document.querySelector("img")
//       if(imageContent){  
//       imageContent.remove();  
//       }  

//     };
//   };
//   document.getElementById('item-image').addEventListener('change', function(e) {
//       // const imageContent = document.querySelector("img")
//       // if(imageContent){  
//       // imageContent.remove();  
//       // }  
//     const file = e.target.files[0];
//     const blob = window.URL.createObjectURL(file);
//       createImageHTML(blob);
//   });
// });
// };