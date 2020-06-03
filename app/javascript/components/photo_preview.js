const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('hidden');
  }
}

export { previewImageOnFileSelect };

// Multiple images preview in browser
// <%= render 'shared/navbar'  %>
//   <h3 class="margin-top-3rem text--terzo text--terzo-bold-little text-align-center">Informazioni del centro</h2>
//   <%= simple_form_for @center,  html: { class: "form-box"} do |f| %>
//     <%= f.input :name, label: 'Nome del centro'  %>
//     <%= f.input :description, as: :text, label: 'Descrizione (Max 240 caratteri)'  %>
//     <div id="address-form-group">
//     <%= f.input :address, label: 'Indirizzo', input_html: {autocomplete: false} %>
//     </div>
//     <%= f.input :phone, label: 'Numero di telefono'  %>
//     <div class="form-group string required center_contact_person"><label class="string required" for="center_contact_person">Responsabile del centro (Nome e Cognome) *</label><input class="form-control string required" type="text" name="center[contact_person_name]" id="center_contact_person" required ></div>
//     <%= f.input :contact_person, label: 'Email del centro'  %>
//     <div class="form-group string required center_contact_person"><label class="string required" for="center_contact_person">Password (almeno 8 caratteri) *</label><input class="form-control string required" type="text" name="center[password]" id="center_contact_person" required ></div>
//     <%#= f.input :closings, as: :string, input_html: {autocomplete: "Seleziona giorni di chiusura data", class: "datepicker-center"}, label: 'Seleziona giorni di chiusura data' %>
//     <p class="text--quarto" style="color: rgba(1, 102, 112, .7)">Seleziona i giorni di chiusura</p>
//     <%= f.input :days, collection: @weekdays, as: :check_boxes, input_html: { multiple: true }, label: "Giorni di chiusura" %>
//     <%= f.input :photos, as: :file, input_html: { multiple: true, onChange: "imagesPreview(this, 'div.gallery')" }, label: "Foto", direct_upload: true %>
//     <p class="text--quarto" style="transform: translateY(-10px);">Inserire 4 foto per lo Slider (MAX 3MB)</p>
//     <p style="color: red"><%= @errors %></p>
//     <div class=" btn-simple-form btn-simple-form--gray" style="margin: -10rem auto 3rem auto;">Aggiungi foto</div>
//     <div class="gallery"></div>
//     <%= f.submit "Salva", class: "btn-simple-form btn-simple-form--green margin-top-3rem" %>
//   <% end %>
//   <script>
//     // Multiple images preview in browser
//     var imagesPreview = function(input, placeToInsertImagePreview) {
//         if (input.files) {
//             var filesAmount = input.files.length;
//             for (i = 0; i < filesAmount; i++) {
//                 var reader = new FileReader();
//                 reader.onload = function(event) {
//                     $($.parseHTML('<img class="preview-img">')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
//                 }
//                 reader.readAsDataURL(input.files[i]);
//             }
//         }
//     };
//   </script>
