<!DOCTYPE html>
<html lang="es-ES">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulario Finanzas</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <style>
    @keyframes progress {
      0% {
        width: 0;
      }

      100% {
        width: 100%;
      }
    }

    @keyframes checkmark {
      0% {
        stroke-dashoffset: 50;
      }

      100% {
        stroke-dashoffset: 0;
      }
    }

    .progress-bar {
      position: absolute;
      top: 0;
      left: 0;
      height: 100%;
      background-color: rgba(255, 255, 255, 0.3);
      animation: progress 10s linear forwards;
    }

    .checkmark {
      width: 24px;
      height: 24px;
      stroke-width: 2;
      stroke: white;
      fill: none;
      stroke-dasharray: 50;
      stroke-dashoffset: 50;
      animation: checkmark 0.5s ease-in-out forwards;
    }

    /* Estilo para el manejo de errores */
    .error-message {
      color: #b91c1c;
      font-weight: bold;
    }

    /* Estilo para el contenedor de categorías */
    #categoryContainer, #subcategoryContainer {
      display: flex;
      overflow-x: auto;
      gap: 1rem;
      padding: 0.5rem 0;
    }

    #categoryContainer label, #subcategoryContainer label {
      flex: 0 0 auto;
    }
  </style>
</head>

<body class="p-4 bg-gray-50">

  <h2 class="font-bold text-center mb-6">Registro</h2>

  <form id="transactionForm" class="space-y-4 bg-white p-6 rounded-lg shadow-md">

    <div class="flex gap-2 justify-center">
      <label class="relative inline-flex items-center cursor-pointer">
        <input type="radio" name="type" value="Gasto" class="peer sr-only" checked onchange="updateCategories()">
        <div
          class="peer-checked:bg-red-500 peer-checked:text-white px-3 py-1 rounded-md text-sm font-semibold transition-all">
          Gasto
        </div>
      </label>
      <label class="relative inline-flex items-center cursor-pointer">
        <input type="radio" name="type" value="Ingreso" class="peer sr-only" onchange="updateCategories()">
        <div
          class="peer-checked:bg-green-500 peer-checked:text-white px-3 py-1 rounded-md text-sm font-semibold transition-all">
          Ingreso
        </div>
      </label>
    </div>

    <!-- Monto -->
    <div>
      <label class="block text-sm font-medium mb-1">Monto</label>
      <div class="relative">
        <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-500 text-sm">$</span>
        <input type="number" name="amount" id="amountInput"
          class="w-full pl-8 pr-28 py-2 text-base font-medium border border-gray-200 rounded-md focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"
          placeholder="0.00" required>
        <div class="absolute right-2 top-1/2 -translate-y-1/2 flex gap-1">
          <button type="button" onclick="decrementAmount()"
            class="w-8 h-8 flex items-center justify-center bg-gray-100 text-gray-600 rounded-full hover:bg-gray-200 text-xs">-</button>
          <button type="button" onclick="incrementAmount()"
            class="w-8 h-8 flex items-center justify-center bg-gray-100 text-gray-600 rounded-full hover:bg-gray-200 text-xs">+</button>
          <button type="button" onclick="clearAmount()"
            class="w-8 h-8 flex items-center justify-center bg-red-100 text-red-600 rounded-full hover:bg-red-200 transition-all font-medium text-sm sm:text-base">×</button>
        </div>
      </div>
    </div>

    <!-- Botones de incremento -->
    <div class="grid grid-cols-4 sm:grid-cols-4 gap-2 sm:gap-3 mt-4 sm:mt-6">
      <button type="button" onclick="addAmount(1)"
        class="py-2 sm:px-6 sm:py-3 border border-gray-200 font-medium rounded-full hover:bg-gray-50 hover:border-gray-300 hover:shadow-sm transition-all duration-200 text-xs sm:text-base">
        +$1
      </button>
      <button type="button" onclick="addAmount(5)"
        class="py-2 sm:px-6 sm:py-3 border border-gray-200 font-medium rounded-full hover:bg-gray-50 hover:border-gray-300 hover:shadow-sm transition-all duration-200 text-xs sm:text-base">
        +$5
      </button>
      <button type="button" onclick="addAmount(10)"
        class="py-2 sm:px-6 sm:py-3 border border-gray-200 font-medium rounded-full hover:bg-gray-50 hover:border-gray-300 hover:shadow-sm transition-all duration-200 text-xs sm:text-base">
        +$10
      </button>
      <button type="button" onclick="addAmount(50)"
        class="py-2 sm:px-6 sm:py-3 border border-gray-200 font-medium rounded-full hover:bg-gray-50 hover:border-gray-300 hover:shadow-sm transition-all duration-200 text-xs sm:text-base">
        +$50
      </button>
      <button type="button" onclick="addAmount(100)"
        class="py-2 sm:px-6 sm:py-3 border border-gray-200 font-medium rounded-full hover:bg-gray-50 hover:border-gray-300 hover:shadow-sm transition-all duration-200 text-xs sm:text-base">
        +$100
      </button>
      <button type="button" onclick="addAmount(500)"
        class="py-2 sm:px-6 sm:py-3 border border-gray-200 font-medium rounded-full hover:bg-gray-50 hover:border-gray-300 hover:shadow-sm transition-all duration-200 text-xs sm:text-base">
        +$500
      </button>
      <button type="button" onclick="addAmount(1000)"
        class="py-2 sm:px-6 sm:py-3 border border-gray-200 font-medium rounded-full hover:bg-gray-50 hover:border-gray-300 hover:shadow-sm transition-all duration-200 text-xs sm:text-base">
        +$1000
      </button>
      <button type="button" onclick="addAmount(10000)"
        class="py-2 sm:px-6 sm:py-3 border border-gray-200 font-medium rounded-full hover:bg-gray-50 hover:border-gray-300 hover:shadow-sm transition-all duration-200 text-xs sm:text-base">
        +$10k
      </button>
    </div>

    <!-- Categorías -->
    <div id="categorySection">
      <label id="categoryLabel" class="block text-sm font-medium mb-1 cursor-pointer">Categorías +</label>
      <div id="categoryContainer" class="grid grid-cols-5 gap-1">
<!-- Aquí van las categorías dinámicas -->
      </div>
    </div>

    <!-- Sub-Categorías -->
    <div id="subcategorySection">
      <label id="subcategoryLabel" class="block text-sm font-medium mb-1 cursor-pointer">Sub-Categorías +</label>
      <div id="subcategoryContainer" class="grid grid-cols-5 gap-1">
<!-- Aquí van las subcategorías dinámicas -->
      </div>
    </div>

    <!-- Descripción -->
    <div>
      <label class="block text-sm font-medium mb-1">Descripción</label>
      <textarea name="description" placeholder="Descripción" id="descriptionInput" rows="3"
        class="w-full px-3 py-2 text-base border border-gray-200 rounded-md focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-all"></textarea>
    </div>

    <!-- Persona -->
    <div>
      <label class="block text-sm font-medium text-gray-700 mb-2">Persona:</label>
      <div class="grid grid-cols-3 gap-1 sm:gap-4">
        <label class="relative cursor-pointer">
          <input type="radio" name="person" value="Lían" class="peer sr-only" checked>
          <div
            class="p-1 text-center border rounded-md peer-checked:border-blue-500 peer-checked:bg-blue-50 transition-all text-xs">
            <div class="text-lg sm:text-xl mb-1">🧔‍♂️</div>
            <div class="text-xs sm:text-base font-medium">Lían</div>
          </div>
        </label>
        <label class="relative cursor-pointer">
          <input type="radio" name="person" value="Katya" class="peer sr-only">
          <div
            class="p-1 text-center border rounded-md peer-checked:border-blue-500 peer-checked:bg-blue-50 transition-all text-xs">
            <div class="text-lg sm:text-xl mb-1">👩</div>
            <div class="text-xs sm:text-base font-medium">Katya</div>
          </div>
        </label>
        <label class="relative cursor-pointer">
          <input type="radio" name="person" value="Alvik" class="peer sr-only">
          <div
            class="p-1 text-center border rounded-md peer-checked:border-blue-500 peer-checked:bg-blue-50 transition-all text-xs">
            <div class="text-lg sm:text-xl mb-1">👶</div>
            <div class="text-xs sm:text-base font-medium">Alvik</div>
          </div>
        </label>
        <label class="relative cursor-pointer">
          <input type="radio" name="person" value="Familia" class="peer sr-only">
          <div
            class="p-1 text-center border rounded-md peer-checked:border-blue-500 peer-checked:bg-blue-50 transition-all text-xs">
            <div class="text-lg sm:text-xl mb-1">👪</div>
            <div class="text-xs sm:text-base font-medium">Familia</div>
          </div>
        </label>
        <label class="relative cursor-pointer">
          <input type="radio" name="person" value="Gatos" class="peer sr-only">
          <div
            class="p-1 text-center border rounded-md peer-checked:border-blue-500 peer-checked:bg-blue-50 transition-all text-xs">
            <div class="text-lg sm:text-xl mb-1">🐈</div>
            <div class="text-xs sm:text-base font-medium">Betty & Hen</div>
          </div>
        </label>
      </div>
    </div>

    <!-- Botón de guardar -->
    <button id="submitButton" type="submit"
      class="w-full py-3 bg-blue-500 text-white font-bold rounded-lg hover:bg-blue-600 transition-all">Guardar
      Registro</button>
    <span id="errorMessage" class="hidden text-red-600 mt-2">Error al guardar registro, inténtalo nuevamente</span>
    <div id="errorMessage2" class="hidden text-red-600 mt-2"></div>
  </form>

  <script>
    document.addEventListener('DOMContentLoaded', loadData);

    const scriptUrl = "https://script.google.com/macros/s/AKfycbz12ufB9cShH9VtMyt1h08kIBQIBlvFdM7Af0UrBy2guAJEyTAcmuVqLRHmPbL5LOR2/exec";
    let subcategoryCounts = {};
    let categoryData = {};

    async function loadData() {
      const url = `https://sheets.googleapis.com/v4/spreadsheets/1zie5dgzPmCqyxmCsSk85sRx2zpuiLZfo-aOLA8kbVwo/values/Finanzas!A2:G?key=AIzaSyCqWowXx5GonkiHTwLcDz9E1VtXZzVCfv0`;
      const categoryContainer = document.getElementById('categoryContainer');
      const errorMessage2 = document.getElementById('errorMessage2');

      try {
        const response = await fetch(url);
        if (!response.ok) throw new Error(`Error HTTP: ${response.status}`);
        const data = await response.json();
        const categoryCounts = {};

        if (data.values) {
          data.values.forEach(row => {
            const type = row[1];
            const category = row[2];
            const subcategory = row[3];
            if (!categoryData[type]) categoryData[type] = {};
            if (category) categoryData[type][category] = (categoryData[type][category] || 0) + 1;
            if (subcategory) {
              if (!subcategoryCounts[category]) subcategoryCounts[category] = [];
              subcategoryCounts[category].push(subcategory);
            }
          });

          updateCategories();
        } else {
          categoryContainer.innerHTML = '<p class="text-sm text-red-600 font-medium">No hay categorías disponibles.</p>';
        }
      } catch (error) {
        console.error('Error:', error);
        errorMessage2.textContent = 'No se pudieron cargar las categorías.';
        errorMessage2.classList.remove('hidden');
      }
    }

    function addAmount(value) {
      const input = document.getElementById('amountInput');
      const currentValue = parseFloat(input.value) || 0;
      input.value = currentValue + value;
    }

    function clearAmount() {
      document.getElementById('amountInput').value = '';
    }

    function incrementAmount() {
      addAmount(1);
    }

    function decrementAmount() {
      addAmount(-1);
    }

    function updateCategories() {
      const selectedType = document.querySelector('input[name="type"]:checked').value;
      const categories = categoryData[selectedType] ? Object.keys(categoryData[selectedType]) : [];
      populateCategories(categories);
    }

    function populateCategories(categories) {
      const categoryContainer = document.getElementById('categoryContainer');
      categoryContainer.innerHTML = categories.length
        ? categories.map(cat => `
          <label class="relative cursor-pointer">
            <input type="radio" name="category" value="${cat}" class="peer sr-only" onchange="populateSubcategories('${cat}')">
            <div
              class="p-1 text-center border rounded-md peer-checked:border-blue-500 peer-checked:bg-blue-50 transition-all text-xs">
              <div class="text-xs sm:text-sm font-medium">${cat}</div>
            </div>
          </label>
        `).join('')
        : '<p class="text-sm text-red-600 font-medium">No hay categorías disponibles.</p>';
    }

    function populateSubcategories(category) {
      const subcategoryContainer = document.getElementById('subcategoryContainer');
      const subcategories = subcategoryCounts[category] || [];
      subcategoryContainer.innerHTML = subcategories.length
        ? subcategories.map(subcat => `
          <label class="relative cursor-pointer">
            <input type="radio" name="subcategory" value="${subcat}" class="peer sr-only">
            <div
              class="p-1 text-center border rounded-md peer-checked:border-blue-500 peer-checked:bg-blue-50 transition-all text-xs">
              <div class="text-xs sm:text-sm font-medium">${subcat}</div>
            </div>
          </label>
        `).join('')
        : '<p class="text-sm text-red-600 font-medium">No hay subcategorías disponibles.</p>';
    }

    async function submitForm(event) {
      event.preventDefault();
      const submitButton = document.getElementById('submitButton');
      const errorMessage = document.getElementById('errorMessage');

      submitButton.disabled = true;
      submitButton.textContent = 'Guardando...';

      const formData = new FormData(event.target);
      formData.append('dateTime', new Date().toISOString());

      console.log("Datos enviados:", Object.fromEntries(formData.entries()));

      const params = new URLSearchParams();
      formData.forEach((value, key) => params.append(key, value));

      try {
        const response = await fetch(scriptUrl, { method: 'POST', body: params });
        if (response.ok) {
          submitButton.textContent = 'Guardado';
          errorMessage.classList.add('hidden');
          event.target.reset();
        } else {
          throw new Error('Error al guardar');
        }
      } catch (error) {
        console.error("Error en la solicitud:", error);
        errorMessage.classList.remove('hidden');
      } finally {
        setTimeout(() => {
          submitButton.disabled = false;
          submitButton.textContent = 'Guardar Registro';
        }, 5000);
      }
    }

    document.getElementById('transactionForm').addEventListener('submit', submitForm);

    document.getElementById('categoryLabel').addEventListener('click', () => {
      const newCategory = prompt('Ingrese el nombre de la nueva categoría:');
      if (newCategory) {
        const categoryContainer = document.getElementById('categoryContainer');
        const newCategoryElement = document.createElement('label');
        newCategoryElement.innerHTML = `
          <input type="radio" name="category" value="${newCategory}" class="peer sr-only" onchange="populateSubcategories('${newCategory}')">
          <div class="p-1 text-center border rounded-md peer-checked:border-blue-500 peer-checked:bg-blue-50 transition-all text-xs">
            <div class="text-xs sm:text-sm font-medium">${newCategory}</div>
          </div>
        `;
        categoryContainer.insertBefore(newCategoryElement, categoryContainer.firstChild);
      }
    });

    document.getElementById('subcategoryLabel').addEventListener('click', () => {
      const selectedCategory = document.querySelector('input[name="category"]:checked');
      if (!selectedCategory) {
        alert('Por favor, seleccione una categoría primero.');
        return;
      }
      const newSubcategory = prompt('Ingrese el nombre de la nueva subcategoría:');
      if (newSubcategory) {
        const subcategoryContainer = document.getElementById('subcategoryContainer');
        const newSubcategoryElement = document.createElement('label');
        newSubcategoryElement.innerHTML = `
          <input type="radio" name="subcategory" value="${newSubcategory}" class="peer sr-only">
          <div class="p-1 text-center border rounded-md peer-checked:border-blue-500 peer-checked:bg-blue-50 transition-all text-xs">
            <div class="text-xs sm:text-sm font-medium">${newSubcategory}</div>
          </div>
        `;
        subcategoryContainer.insertBefore(newSubcategoryElement, subcategoryContainer.firstChild);
      }
    });
  </script>
</body>

</html>
