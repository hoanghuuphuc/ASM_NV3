package com.poly.asm_nv3.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Accounts")
public class Account  implements Serializable{
	@Id
	String username;

	String password;

	String fullname;

	String photo;

	String activation_token;

	String reset_token;

	Boolean active;

	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	List<Authority> authorities;

	private String encrypt(String plaintext) {
		// use a secure encryption algorithm (e.g., AES) to encrypt the plaintext
		// and return the encrypted result as a string
		return plaintext;
	}
	public void generateActivationToken() {
		String identifier = UUID.randomUUID().toString(); // generate a unique identifier
		long timestamp = new Date().getTime(); // get the current timestamp
		String plaintext = identifier + ":" + timestamp; // combine the identifier and timestamp
		String token = encrypt(plaintext); // encrypt the combination
		this.activation_token = token; // set the activation token on the account
	}
	public void generateResetToken() {
		String identifier = UUID.randomUUID().toString(); // generate a unique identifier
		long timestamp = new Date().getTime(); // get the current timestamp
		String plaintext = identifier + ":" + timestamp; // combine the identifier and timestamp
		String token = encrypt(plaintext); // encrypt the combination
		this.reset_token = token; // set the reset token on the account
	}

}
