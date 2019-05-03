site.forms = {};

/**
 * ADD events to forms
 */
site.forms.init = function () {
	var context = jQuery('.required').closest("form");
	jQuery('input, textarea, select', context).focusout(function() {
		site.forms.errors.check(this);
	});
	/*site.forms.data.restore();*/
	site.forms.comments.init();
	if (location.href.indexOf('forget') != -1) {
		jQuery('#forget input:radio').click(function() {
			jQuery('#forget input:text').attr('name', jQuery(this).attr('id'));
		});
	}
	else if (location.href.indexOf('purchasing_one_step') != -1) {
		site.forms.emarket.purchasingOneStep();
	}
};

site.forms.data = {};

site.forms.data.save = function (form) {
	if (!form && !form.id) return false;
	var str = "", input, inputName, i, opt_str = "", o;
	for (i = 0; i < form.elements.length; i++) {
		input = form.elements[i];
		if (input.name) {
			inputName = input.name.replace(/([)\\])/g, "\\$1");
			switch (input.type) {
				case "password":break;
				case "text":
				case "textarea": str += 'TX,' + inputName + ',' + input.value; break;
				case "checkbox":
				case "radio": str += 'CH,' + input.id + ',' + (input.checked ? 1 : 0); break;
				case "select-one": str += 'SO,' + inputName + ',' + input.selectedIndex; break;
				case "select-multiple": {
					for (o = 0; o < input.options.length; o++) {
						if (input.options[o].selected) {
							opt_str += input.options[o].value;
							if (o < (input.options.length - 1)) opt_str += ":";
						}
					}
					str += 'SM,' + inputName + ',' + opt_str; break;
				}
			}
			if (i < (form.elements.length - 1)) str += "+";
		}
	}
	jQuery.cookie("frm" + form.id, str.replace(/([|\\])/g, "\\$1"));
	return true;
};


site.forms.data.restore = function () {
	var forms = jQuery('form'), i, j, element, data;
	for (i = 0; i < forms.length; i++) {
		if (forms[i].id && (data = jQuery.cookie("frm" + forms[i].id))) {
			data = data.split('+');
			for (j = 0; j < data.length; j++) {
				element = data[j].split(',');
				if (!element) continue;
				switch (element[0]) {
					case "PW": break;
					case "TX": forms[i].elements[element[1]].value = element[2]; break;
					case "CH": document.getElementById(element[1]).checked = (element[2] == 1) ? true : false; break;
					case "SO": forms[i].elements[element[1]].selectedIndex = element[2]; break;
					case "SM":
						var options = forms[i].elements[element[1]].options;
						var opt_arr = element[2].split(":"), op, o;
						for (op = 0; op < options.length; op++)
							for (o = 0; o < opt_arr.length; o++)
								if (opt_arr[o] && (options[op].value == opt_arr[o]))
									options[op].selected = true;
						break;
				}
			}
		}
	}
	return true;
};

site.forms.errors = {};

/**
 * Генерация ошибок
 *
 * @param {Object} element Проверяемый элемент формы
 * @param {Number} num Позиция элемента формы
 * @param {Boolean} bool Сообщение об ошибке
 * @return {Boolean} Результат корректности заполнения
 */
site.forms.errors.check = function(element, bool) {
	var _err, empty_err = i18n.forms_empty_field; 
	if(element.parentNode.className != 'required') return false;
	switch (element.name) {
		case "login": {
			switch (element.value.length) {
				case 0: _err = empty_err; break;
				case 1:
				case 2: _err = i18n.forms_short_login; break;
				default: {
					if (element.value.length > 40) _err = i18n.forms_long_login;
				}
			}
			break;
		}
		case "password": {
			switch (element.value.length) {
				case 0: _err = empty_err; break;
				case 1:
				case 2: _err = i18n.forms_short_pass; break;
				default: {
					if (element.form.elements['login'].value == element.value)
						_err = i18n.forms_same_pass;
				}
			}
			break;
		}
		case "password_confirm": {
			if (element.value.length == 0) _err = empty_err;
			else if (element.form.elements['password'].value !== element.value) {
				_err = i18n.forms_confirm_pass;
			}
			break;
		}
		case "email": {
			if (element.value.length == 0) _err = empty_err;
			else if (!element.value.match(/.+@.+\..+/)) _err = i18n.forms_invalid_email;
			//else if (typeof num != 'undefined'); //checkUserEmail callback
			break;
		}
		default: {
			if (element.value.length == 0) _err = empty_err;
			if (element.name.match(/^.*e.*mail.*$/) && element.name != 'email_to' && element.name != 'system_email_to')
				if (!element.value.match(/.+@.+\..+/)) _err = i18n.forms_invalid_email;
		}
	}
	if (bool) {
		return !_err;
	} else {
		return site.forms.errors.write(_err, element);
	}
};

site.forms.errors.write = function (_err, element) {
	var cont = element;
	jQuery(cont).attr('id','formcorrect');
	if (_err) {
		cont.id = "formErr";
		if (element.name == "password_confirm") element.value = "";
		element.focus();
		return false;
	}
	return true;
};
