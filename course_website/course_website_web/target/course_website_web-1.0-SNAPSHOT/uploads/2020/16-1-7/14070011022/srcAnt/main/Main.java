package main;

import java.util.Scanner;

import dog.Dog;
import pig.Pig;

public class Main {
	public static void main(String[] args) {
		Scanner scanner=new Scanner(System.in);
		Dog dog=new Dog(scanner.next(), scanner.nextInt());
		Pig pig=new Pig(scanner.next(), scanner.nextInt());
		System.out.println("dog:"+dog.getName()+" "+dog.getAge());
		System.out.println("pig:"+pig.getName()+" "+pig.getAge());
	}
}
