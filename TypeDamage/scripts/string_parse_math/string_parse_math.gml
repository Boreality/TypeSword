// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_parse_math(_mytext){
	/// @function string_parse_math( text);
/// @param {string}	text	Text to parse
/// @description Parses a mathematical expression and returns the evaluation

/// Define arguments
var text = argument0;

#region Split at parenthesis

// Remove whitespace
text = string_replace_all( text, " ", "");

var parenthesisLayer = 0;
var parenthesisStart, parenthesisEnd;

for( var i = 1; i <= string_length( text); ++i){
	if( string_char_at( text, i) == "("){
		if( parenthesisLayer++ == 0){
			parenthesisStart = i + 1;
		}
	}else if( string_char_at( text, i) == ")"){
		if( --parenthesisLayer == 0){
			parenthesisEnd = i;
			
			var insideParenthesis = string_copy( text, parenthesisStart, parenthesisEnd - parenthesisStart);
			
			var result = string_parse_math( insideParenthesis);
			
			text = string_replace( text, "(" + insideParenthesis + ")", string(result));
			
			i = 0;
		}
	}
}

#endregion

#region Split into tokens

var tokens = ds_list_create();

var i = 0;
while( string_length( text) != string_length( string_digits( text))){
	var slt = string_length( text);
	var sd = string_digits( text);
	var slsd = string_length( sd);
	
	if( ++i > string_length( text)) break;
	
	var char = string_char_at( text, i);
	var isCarat = ord(char) == ord("^");
	var isOperator = ord( char) >= ord("*") && ord( char) <= ord( "/");
	
	if( isCarat || isOperator){
		var num = string_copy( text, 1, i - 1);
		var operator = string_copy( text, i, 1);
		
		// Check if - is actually a negative sign
		if( operator == "-"){
			var prevChar = string_char_at( text, i - 1);
			if( ord( prevChar) < ord( "0") || ord(prevChar) > ord("9")){
				continue;
			}
		}
		
		ds_list_add( tokens, num, operator);
		
		text = string_copy( text, i + 1, string_length( text) - i);
		
		i = 0;
	}
}

ds_list_add( tokens, text);

#endregion

#region Evaluate expression

// Resolve exponents
for( var i = 0; i < ds_list_size( tokens); ++i){
	if( tokens[| i] == "^"){
		var lh = real(tokens[| i - 1]);
		var rh = real(tokens[| i + 1]);
		
		tokens[| i - 1] = power( lh, rh);
		
		ds_list_delete( tokens, i);
		ds_list_delete( tokens, i);
		
		i = 0;
	}
}

// Resolve Multiplication / Division
for( var i = 0; i < ds_list_size( tokens); ++i){
	var isMultiplication = tokens[| i] == "*";
	var isDivision = tokens[| i] = "/";
	
	if( isMultiplication || isDivision){
		var lh = real(tokens[| i - 1]);
		var rh = real(tokens[| i + 1]);
		
		if( isMultiplication){
			tokens[| i - 1] = lh * rh;
		}else{
			tokens[| i - 1] = lh / rh;
		}
		
		ds_list_delete( tokens, i);
		ds_list_delete( tokens, i);
		
		i = 0;
	}
}

// Resolve Addition / Subtraction
for( var i = 0; i < ds_list_size( tokens); ++i){
	var isAddition = tokens[| i] == "+";
	var isSubtraction = tokens[| i] == "-";
	
	if( isAddition || isSubtraction){
		var lh = real( tokens[| i - 1]);
		var rh = real( tokens[| i + 1]);
		
		if( isAddition){
			tokens[| i - 1] = lh + rh;
		}else{
			tokens[| i - 1] = lh - rh;
		}
		
		ds_list_delete( tokens, i);
		ds_list_delete( tokens, i);
		
		i = 0;
	}
}

#endregion

#region Return

var ret = tokens[| 0];

ds_list_destroy( tokens);

return ret;

#endregion
}