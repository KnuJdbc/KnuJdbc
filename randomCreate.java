package mpackage;

public class randomCreate {
	
	public boolean exists(int n[], int idx) {
		if (idx == 86) return true;
		
		for (int i = 0; i < n.length; i++) {
			if (n[i] == idx)
				return true;
		}
		return false;
	}
	
	public int[] rand_num(int ani_cnt) {
		int n[] = new int[5];
		int idx = 0;
		
		for (int i = 0; i < n.length; i++) {
			do {
				idx = (int)(Math.random() * ani_cnt) + 1;
			} while(exists(n, idx));
			n[i] = idx;
		}
		return n;
	}
}
