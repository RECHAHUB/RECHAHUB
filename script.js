// Products
let products = [
  {id:1,name:"Maru Hub Mobile",price:100,img:"https://via.placeholder.com/200",stock:5},
  {id:2,name:"Maru Hub PC",price:100,img:"https://via.placeholder.com/200",stock:10},
  {id:3,name:"Maru Hub 7 หมัด",price:149,img:"https://via.placeholder.com/200",stock:2}
];

// Render products
function renderProducts(){
  productList.innerHTML = "";
  products.forEach(p=>{
    const card = document.createElement('div');
    card.className = "product-card";
    card.innerHTML = `
      <img src="${p.img}" alt="${p.name}">
      <h3>${p.name}</h3>
      <p>${p.price} บาท</p>
      <p>คงเหลือ: ${p.stock}</p>
      <button onclick="buyProduct(${p.id})" ${p.stock<=0?'disabled':''}>
        ${p.stock>0?'ซื้อสินค้า':'สินค้าหมด'}
      </button>
      ${isAdmin?`<button onclick="editProduct(${p.id})">แก้ไข</button>
      <button onclick="deleteProduct(${p.id})">ลบ</button>`:""}
    `;
    productList.appendChild(card);
  });
}

// Buy function
function buyProduct(id){
  const product = products.find(p=>p.id===id);
  if(product){
    if(product.stock>0){
      product.stock--;
      alert(`ซื้อสินค้า: ${product.name} ราคา ${product.price} บาท\nคงเหลือ: ${product.stock}`);
      renderProducts();
    } else {
      alert("สินค้าหมดแล้ว");
    }
  }
}

// Admin: add/edit products (with stock)
adminBtn.addEventListener('click', ()=>{
  const action = prompt("เลือก: add / edit / cancel");
  if(action==="add"){
    const name = prompt("ชื่อสินค้าใหม่");
    const price = parseInt(prompt("ราคา"));
    const img = prompt("URL รูป");
    const stock = parseInt(prompt("จำนวนสินค้า"));
    if(name && price && img && !isNaN(stock)) products.push({id:products.length+1,name,price,img,stock});
  } else if(action==="edit"){
    products.forEach(p=>{
      const newName = prompt(`แก้ไขชื่อสินค้า ID:${p.id}`, p.name);
      if(newName) p.name = newName;
      const newPrice = parseInt(prompt(`แก้ไขราคา ID:${p.id}`, p.price)) || p.price;
      p.price = newPrice;
      const newImg = prompt(`แก้ไข URL รูป ID:${p.id}`, p.img);
      if(newImg) p.img = newImg;
      const newStock = parseInt(prompt(`แก้ไขจำนวนสินค้า ID:${p.id}`, p.stock)) || p.stock;
      p.stock = newStock;
    });
  }
  renderProducts();
});
